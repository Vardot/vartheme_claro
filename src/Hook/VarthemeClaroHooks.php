<?php

declare(strict_types=1);

namespace Drupal\vartheme_claro\Hook;

use Drupal\Core\DependencyInjection\ContainerInjectionInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Hook\Attribute\Hook;
use Drupal\Core\Routing\RouteMatchInterface;
use Drupal\node\NodeInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Hook implementations for the Vartheme Claro theme.
 */
class VarthemeClaroHooks implements ContainerInjectionInterface {

  public function __construct(
    protected RouteMatchInterface $routeMatch,
    protected EntityTypeManagerInterface $entityTypeManager,
  ) {}

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container): static {
    return new static(
      $container->get('current_route_match'),
      $container->get('entity_type.manager'),
    );
  }

  /**
   * Implements hook_theme_suggestions_HOOK_alter() for page templates.
   *
   * Adds a page--[bundle] suggestion when viewing a node.
   */
  #[Hook('theme_suggestions_page_alter')]
  public function themeSuggestionsPageAlter(array &$suggestions, array $variables): void {
    $node = $this->routeMatch->getParameter('node');
    if (is_numeric($node)) {
      $node = $this->entityTypeManager->getStorage('node')->load($node);
    }
    if ($node instanceof NodeInterface) {
      array_splice($suggestions, 1, 0, 'page__' . $node->bundle());
    }
  }

  /**
   * Implements hook_library_info_alter().
   *
   * Extends Claro's global styling with the Vartheme Claro layout node form
   * library on Drupal 10+ (Drupal 9 / CKEditor 4 paths dropped on this branch).
   */
  #[Hook('library_info_alter')]
  public function libraryInfoAlter(array &$libraries, string $extension): void {
    if ($extension === 'claro' && isset($libraries['global-styling'])) {
      $libraries['global-styling']['dependencies'][] = 'vartheme_claro/claro10.layout-node-form';
    }
  }

}
