Feature: Sign in

  Scenario: Sign in
    Given I have registered
    When I find myself on the sign-in page
    And I re-enter my details
    When I click Sign in
    Then I should be signed in
