Feature: Soon counter
  As a User
  I should be able to see a inverse counter until next season start


@wip
Scenario: Pending season counter
  Given a pending Season exists
  When I go to the Home page
  Then I should see the Soon counter
