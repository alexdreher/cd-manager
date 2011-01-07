Feature: Manage albums
  In order to show my albums
  As a registered user with an attached artist
  I want to be able to create and manage my albums
  
  Scenario: Create new album
    Given I am logged in and have the artist "Singer McSing"
    And I am on my artist page for "Singer McSing"
    When I follow "New Album"
    And I fill in "Title" with "Best of"
    And I fill in "Released at" with "2009-11-01"
    And I press "Create Album"
    Then I should see "Album was successfully created."

  Scenario: Create new album with cover
    Given I am logged in and have the artist "Singer McSing"
    And I am on my artist page for "Singer McSing"
    When I follow "New Album"
    And I fill in "Title" with "Best of"
    And I fill in "Released at" with "2009-11-01"
    And I attach the file "features/support/cover.jpg" to "Cover"
    And I press "Create Album"
    Then I should see "Album was successfully created."
    
  Scenario: Create new album with tracks
    Given I am logged in and have the artist "Singer McSing"
    And I am on my artist page for "Singer McSing"
    When I follow "New Album"
    And I fill in "Title" with "Best of"
    And I fill in "Released at" with "2009-11-01"
    And I fill in "Track title" with "First track"
    And I press "Create Album"
    Then I should see "Album was successfully created."