Feature: Create a warranty
  In order to manage my warranty
  As a user
  I want to create a warranty

  Background:
    Given I am logged in as a user with email "john@example.com" and password "secret"

  Scenario: Entering a new warranty
    Given I am on the warranties page
    When I follow "Add Warranty"
    Then I should be on the new warranty page

  Scenario: Create a valid warranty
    Given I am on the new warranty page
    And I create a valid warranty
    Then I should see the warranty's detail page
    When I go to the warranties page
    Then I should see a listing of my warranties

  Scenario: Cancel creation
    Given I am on the new warranty page
    When I cancel the creation
    Then I should be on the warranties page

  Scenario: Create an invalid warranty
    Given I am on the new warranty page
    And I create an invalid warranty
    Then I should see that the warranty is invalid

