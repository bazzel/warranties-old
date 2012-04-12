Feature: Edit profile
  As a registered user
  I want to edit profile
  So I can control how I access the application

  Scenario: Viewing my profile page
    Given I am logged in as a user with email "john@example.com" and password "secret"
    When I edit my profile
    Then I should see my profile page

  Scenario: Changing locale settings
    Given I am logged in as a user with email "john@example.com" and password "secret"
    When I change my language to "Nederlands"
    Then the application is presented in Dutch


