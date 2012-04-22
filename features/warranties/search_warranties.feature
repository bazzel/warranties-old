Feature: Search warranties
  In order to find the warranty I'm looking for
  I want to have search functionality
  So I can easily select the one I need

  Scenario: List all warranties
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranties:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
     | Sewing machine        | hello-kitty-sewing-machine.jpeg |
     | Electrical toothbrush | Electrical_toothbrush.jpeg      |
    And I go to the warranties page
    When I search for "Vacuum cleaner"
    Then I should see the following warranties in the search results:
     | name                  | visible |
     | Vacuum cleaner        | true    |
     | Sewing machine        | false   |
     | Electrical toothbrush | false   |

