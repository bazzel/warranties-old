Feature: Search warranties
  In order to find the warranty I'm looking for
  I want to have search functionality
  So I can easily select the one I need

  Scenario: List all warranties
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranties:
     | name                  | warranty                        | notes                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             | Lorem ipsum                  |
     | Sewing machine        | hello-kitty-sewing-machine.jpeg | This is not a vacuum cleaner |
     | Electrical toothbrush | Electrical_toothbrush.jpeg      | More lorem ipsum             |
    And I go to the warranties page
    When I search for "Vacuum cleaner"
    Then I should see the following warranties in the search results:
     | name                  | visible |
     | Vacuum cleaner        | true    |
     | Sewing machine        | true    |
     | Electrical toothbrush | false   |

