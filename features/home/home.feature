Feature: Home page
  As a User
  I should be able to see the main Home page

  Background:
    Given a pending Season exists
      And I am on the Home page

  Scenario: Menu
    Then I should see the main Menu

  Scenario: Footer
    Then I should see the main Footer
