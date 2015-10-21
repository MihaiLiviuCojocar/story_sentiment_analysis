Feature: Handling errors

  Scenario: When route does not exist
    Given I want to visit a page that does not exist
    Then I shoud be informed that the page could not be found