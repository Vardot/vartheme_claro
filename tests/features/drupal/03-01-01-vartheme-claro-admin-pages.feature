@vartheme_claro @admin
Feature: Vartheme Claro - administration pages render
  As a site administrator using Vartheme Claro as the administration theme
  I want the key administration pages to render without errors
  So that I can manage the site

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The content overview page renders
    When I go to "/admin/content"
    Then I should see "Content"
    And I should not see "The website encountered an unexpected error"
    And I should not see "Access denied"

  Scenario: The structure page renders
    When I go to "/admin/structure"
    Then I should see "Structure"
    And I should see "Content types"
    And I should not see "The website encountered an unexpected error"
    And I should not see "Access denied"

  Scenario: The people page renders
    When I go to "/admin/people"
    Then I should see "People"
    And I should not see "The website encountered an unexpected error"
    And I should not see "Access denied"

  Scenario: The configuration page renders
    When I go to "/admin/config"
    Then I should see "Configuration"
    And I should not see "The website encountered an unexpected error"
    And I should not see "Access denied"

  Scenario: The add content page renders
    When I go to "/node/add"
    Then I should see "Add content"
    And I should see "Article"
    And I should not see "The website encountered an unexpected error"
    And I should not see "Access denied"
