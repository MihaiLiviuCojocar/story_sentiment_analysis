Feature: Handling errors

  Scenario: When route does not exist
    Given I want to visit a page that does not exist
    Then I shoud be informed that the page could not be found

  Scenario: Comapany's ticker code is not upcased
    Given A company
      | name      | ticker_code |
      | Apple Inc | AAPL        |
    When I visit "/companies/aapl"
    Then I should see "Apple Inc"

  Scenario: When the company does not exist
    Given There is no company in the DB
    When I visit "/companies/something"
    Then I shoud be informed that the page could not be found
