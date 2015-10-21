Feature: Displaying the companies

  Background:
    Given A company
      | name      | ticker_code |
      | Apple Inc | AAPL        |

  Scenario: Companies have been added to the DB
    When I visit the homepage
    Then I should see "Apple Inc"
