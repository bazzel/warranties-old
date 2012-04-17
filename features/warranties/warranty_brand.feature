Feature: Adding brand to a warranty
  As a user
  I want to be able to add a brand to my warranty
  So I have more detailed information

  Scenario: Adding a new brand to a warranty
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranty:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
    And I go to the warranty's edit page
    And I type "Philips" into the "Brand" input
    And I submit the form
    Then I should have one brand
    And I should see "Philips" on the warranty's detail page
