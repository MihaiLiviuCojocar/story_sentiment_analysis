Feature: Displaying the companies

  Background:
    Given A company called "Apple Inc" has been added

  Scenario: Companies have been added to the DB
    When I visit the homepage
    Then I should see "Apple Inc"
