Feature: Create a warranty
  In order to manage my warranty
  As a user
  I want to create a warranty

  Scenario: Create a valid warranty
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I am on the new warranty page
    And I create a valid warranty
    Then I should see the warranty's detail page
