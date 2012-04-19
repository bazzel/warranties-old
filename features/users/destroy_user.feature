Feature: Clean up after destroying user
  As a user
  I want all my data to be removed when I delete my account
  So that I leave no trace

  Scenario: Delete warranties
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following warranties:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
     | Sewing machine        | hello-kitty-sewing-machine.jpeg |
     | Electrical toothbrush | Electrical_toothbrush.jpeg      |
   When I delete my account
   Then all my warranties were deleted as well

  Scenario: Delete brands
    Given I am logged in as a user with email "john@example.com" and password "secret"
    And I have the following brands:
     | name  |
     | Apple |
     | Sony  |
     | Pearl |
   When I delete my account
   Then all my brands were deleted as well

