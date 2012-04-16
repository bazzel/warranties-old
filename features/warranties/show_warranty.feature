Feature: Viewing a warranty
  As a user
  I want to see the details of my warranty
  So I don't have to remember them

  @javascript
  Scenario: Viewing popup
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranty:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
    And I go to the warranty's detail page
    And I click on the image for the warranty
    Then I should see a larger version popping up


