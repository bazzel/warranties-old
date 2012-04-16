Feature: Create a warranty
  In order to have a better overview
  As a user
  I want to be able to upload a photo of my thing

  Background:
    Given I am logged in as a user with email "john@example.com" and password "secret"

  Scenario: Create a valid warranty
    Given I am on the new warranty page
    And I enter valid data on the warranty's form
    And I upload a photo of the warranty's product
    And I submit the form
    When I crop the photo of the warranty's product
    Then I should see the warranty's detail page


