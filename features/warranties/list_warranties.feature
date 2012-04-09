Feature: List warranties
  In order to manage my warranties
  I want to see an overview of them
  So I can easily select the one I need

  Scenario: List all warranties
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranties:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
     | Sewing machine        | hello-kitty-sewing-machine.jpeg |
     | Electrical toothbrush | Electrical_toothbrush.jpeg      |
    And I go to the warranties page
    Then I should see a listing of my warranties
    When I click on the image of the first warranty
    Then I should see the warranty's detail page
