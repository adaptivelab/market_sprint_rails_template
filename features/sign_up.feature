Feature: Sign Up

  Scenario: Sign Up
    Given I find myself on the sign-up page
    And I enter in the right information
    When I click Sign up
    Then I should be signed up and signed in
