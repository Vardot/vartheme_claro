@vartheme_claro @appearance
Feature: Vartheme Claro - theme settings
  As a site administrator
  I want the Vartheme Claro theme settings page to load
  So that I can configure the administration theme

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The Vartheme Claro theme settings page loads
    When I go to "/admin/appearance/settings/vartheme_claro"
    Then I should see "Vartheme Claro"
    And I should see "Save configuration"
    And I should not see "The website encountered an unexpected error"
    And I should not see "Access denied"
