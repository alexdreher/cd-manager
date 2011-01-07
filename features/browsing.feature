Feature: Browsing
  In order to view the contents of the site
  As a (anonymous) user
  I want to be able to browse the website
  
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

      
  Scenario: View an alphabetical list of artists
    Given I am on the home page
    When I follow "Artists" within "#navigation"
    Then I should be on the artists list
    And I should see an artists table
      | andrew |
      | berta  |
      | peter  |
      
  Scenario: View an alphabetical list of an artists albums
    Given I am on the home page
    When I follow "Artists" within "#navigation"
    Then I should be on the artists list
    When I follow "peter"
    Then I should be on the album list of "peter"
    And I should see an albums table
      | A First Album |
      | Second Album  |
      
  Scenario: View an album with cover
    Given I am on the albums list
    When I follow "A First Album"
    Then I should see the cover image
  
  Scenario: View an album with track list
    Given I am on on the albums list
    When I follow "A First Album"
    #Then show me the page
    Then I should see a tracks table
      | First Track  |
      | Second Track |
      | Third Track  |
