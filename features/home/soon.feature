Feature: Soon Countdown
  As a User
  I should be able to see a countdown until next Season start

  Background:
    Given a pending Season exists
      And I am on the Home page

  Scenario: Countdown for next Season
    Then I should see the Soon counter
      And I should see the next Game info
