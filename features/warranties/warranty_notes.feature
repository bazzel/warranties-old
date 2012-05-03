Feature: Adding note to a warranty
  As a user
  I want to be able to add a note to my warranty
  So I have more detailed information

  Scenario: Viewing note in a popover
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranties:
     | name           | warranty            | notes       |
     | Vacuum cleaner | vacuum-cleaner.jpeg | Lorem ipsum |
    When I go to the warranties page
    And I should see a "Notes" popover for "Lorem ipsum"

  Scenario: Loooooong note will be collapsed
