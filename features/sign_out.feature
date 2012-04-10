Feature: Signing out
  In order to sign in as another user
  I want to be able to sign out
  So I can see the sign in screen again

  Scenario: Signing out
    Given I am logged in as a user with email "john@example.com" and password "secret"
    When I sign out
    Then I should be on the sign in page
