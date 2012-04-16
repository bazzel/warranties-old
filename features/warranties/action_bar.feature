Feature: Action bar
  As a user
  I want to have an action bar
  So I can do what I want more easily

  Background:
    Given I am logged in as a user with email "john@example.com" and password "secret"

  Scenario: Action bar while viewing a warranty
    And I have the following warranty:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
    And I go to the warranty's detail page
    Then I see the following items in the action bar:
     | name          | visible |
     | Back          | true    |
     | Edit          | true    |
     | View Warranty | true    |
     | Destroy       | true    |

  Scenario: Action bar while adding a warranty
    Given I am on the new warranty page
    Then I see the following items in the action bar:
     | name          | visible |
     | Back          | true    |
     | Edit          | false   |
     | View Warranty | false   |
     | Destroy       | false   |

  Scenario: Action bar while editing a warranty
    Given I have the following warranty:
     | name                  | warranty                        |
     | Vacuum cleaner        | vacuum-cleaner.jpeg             |
    And I go to the warranty's detail page
    And I click on the Edit button
    Then I see the following items in the action bar:
     | name          | visible |
     | Back          | true    |
     | Edit          | false   |
     | View Warranty | true    |
     | Destroy       | true    |
