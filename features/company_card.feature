Feature: Company card

  Background:
    Given A company
      | name      | ticker_code |
      | Apple Inc | AAPL        |
    And I visit the homepage
    And I click on "Apple Inc"

  Scenario: Click on the company
    Then I should be on the "Apple Inc" card page
    And I should see "Apple Inc"

  Scenario: The company is not found on the external web service
    Then I should see:
      | Ticker Code    | AAPL |
      | Latest Price   | N/A  |
      | As Of          | N/A  |
      | Latest Stories | N/A  |