Feature: Static Image
  In order to build quickly
  As a developer
  I want to be able to stick a clickable static image in easily

  Scenario: Show a static image
    Given I have a page with slug, "my_image"
    And I visit /pages/my_image
    Then I see the image

  @javascript
  Scenario: Clickable static image
    Given I am viewing a static image
    When I click on the image
    Then I am on the next page
