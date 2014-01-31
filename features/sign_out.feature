Feature: Sign Out

  Scenario: Sign Out
    Given I'm logged in
    When I click Sign Out
    Then I should not see the Sign Out option any more
