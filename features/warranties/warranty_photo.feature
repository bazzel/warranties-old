Feature: Create a warranty
  In order to have a better overview
  As a user
  I want to be able to upload a photo of my thing

  Background:
    Given I am logged in as a user with email "john@example.com" and password "secret"

  Scenario: Crop the warranty's photo on creation
    Given I am on the new warranty page
    And I enter valid data on the warranty's form
    And I upload a photo of the warranty's product
    And I submit the form
    When I crop the photo of the warranty's product
    Then I should see the warranty's detail page

  Scenario: Crop the warranty's photo on updating
    Given I have the following warranties:
     | name                  | warranty                        |
     | Electrical toothbrush | Electrical_toothbrush.jpeg      |
    And I go to the warranties page
    And I click on the Edit button of the first warranty
    And I upload a photo of the warranty's product
    And I submit the form
    When I crop the photo of the warranty's product
    Then I should see the warranty's detail page

  Scenario: No 'Remove photo' option for new warranty
    Given I am on the new warranty page
    Then I cannot remove the photo

  Scenario: No 'Remove photo' for warranty without photo
    Given I have the following warranties:
     | name                  | warranty                   | photo    |
     | Electrical toothbrush | Electrical_toothbrush.jpeg | 1000.gif |
    And I go to the warranties page
    And I click on the Edit button of the first warranty
    Then I can remove the photo
