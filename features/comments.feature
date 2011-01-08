Feature: Comments
  In order to spread my opinions about an album
  As a user
  I want to be able to comment it
  
  Background:
    Given the following artist records
      | id | name       | user_id |
      | 1  | The Artist | 1       |

    Given the following album records
      | id | title     | artist_id |
      | 1  | The Album | 1         |


  Scenario: Comment an album
    Given I am on the albums list
    When I follow "The Album"
    And I fill in "Comment text" with "A really good album"
    And I press "Create Comment"
    Then I should see "Comment was successfully created."
    And I should see "A really good album"