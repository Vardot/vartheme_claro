@vartheme_claro @appearance
Feature: Vartheme Claro - appearance
  As a site administrator
  I want the Vartheme Claro administration theme available on the appearance page
  So that I can use it as the site's administration theme

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The appearance page lists the Vartheme Claro administration theme
    When I go to "/admin/appearance"
    Then I should see "Appearance"
    And I should see "Vartheme Claro"
    And I should see "Claro"
    And I should not see "The website encountered an unexpected error"
    And I should not see "Access denied"
