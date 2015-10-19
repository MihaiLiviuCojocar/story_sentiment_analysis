Feature: Company card

  Background:
    Given A company
        | name      | ticker_code |
        | Apple Inc | AAPL        |

  Scenario: Click on the company
    When I visit the homepage
    And I click on "Apple Inc"
    Then I should be on the "Apple Inc" card page
    And I should see "Apple Inc"