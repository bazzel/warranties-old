Feature: Editing a warranty
  As a user
  I want to be able to edit my warranty
  So I can update it with the correct details

  Scenario: Entering the Edit page from dashboard
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranties:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
     | Sewing machine        | hello-kitty-sewing-machine.jpeg |
     | Electrical toothbrush | Electrical_toothbrush.jpeg      |
    And I go to the warranties page
    And I click on the Edit button of the first warranty
    Then I should be on the warranty's edit page

  Scenario: Entering the Edit page from show page
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranty:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
    And I go to the warranty's detail page
    And I click on the Edit button
    Then I should be on the warranty's edit page

  Scenario: Update a warranty with valid data
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranty:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
    And I update the warranty with valid data
    Then I should see the warranty's detail page

  Scenario: Cancel update
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranty:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
    And I go to the warranty's edit page
    When I cancel the update
    Then I should be on the warranties page

  Scenario: Update a warranty with invalid data
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranty:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
    And I update the warranty with invalid data
    Then I should see that the warranty is invalid
