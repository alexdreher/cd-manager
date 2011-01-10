@no-txn
Feature: Search
  In order to find the contents of the site
  As a (anonymous) user
  I want to be able to search the website
  
  Background:
    Given the following artist records
      | name   | user_id | id |
      | peter  | 1       | 1  |
      | andrew | 2       | 2  |
      | berta  | 3       | 3  |
      
    Given the following album records
      | id | title         | artist_id |
      | 1  | Second Album  | 1         |
      | 2  | A First Album | 1         |
      | 3  | Bertas Album  | 3         |
      
    Given the following track records
      | title        | album_id |
      | First Track  | 2        |
      | Second Track | 2        |
      | Third Track  | 2        |
  
  Scenario: Search the website
    Given the Sphinx indexes are updated
    And I am on on the home page
    When I fill in "search" with "thir"
    And I press "Search"
    Then I should see "Third Track"