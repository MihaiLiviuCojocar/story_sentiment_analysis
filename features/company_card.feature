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
      | £              | N/A  |
      | Latest Stories | N/A  |

  Scenario: The company is found but there is no story feed
    Then I should see:
      | Ticker Code    | AAPL                      |
      | £              | 1945                      |
      |                | Sun Oct 19 14:06:52 2014  |
      | Latest Stories | N/A                       |

  Scenario: The company is found and it has a story feed
    Given A company
      | name       | ticker_code |
      | Google Inc | GOOG        |
    And I visit the homepage
    When I click on "Google Inc"
    Then I should see:
      | Ticker Code    | GOOG                          |
      | £              | 54407                         |
      |                | Mon Oct 19 15:23:23 2015      |
      | Latest Stories |                               |
      | Going strong   | Apple Inc is                  |
      | Google revenue | Stocks finished               |




