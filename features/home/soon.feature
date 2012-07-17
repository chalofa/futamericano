Feature: Soon Countdown
  As a User
  I should be able to see a inverse counter until next season start

  Background:
    Given a pending Season exists
      And I am on the Home page

  @wip
  Scenario: Countdown for pending Season
    Then I should see the Soon counter
