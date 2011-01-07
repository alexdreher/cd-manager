Feature: Artist functions
  In order to show that I am an artist
  As an authenticated user
  I want to attach an artist to my user
  
  Background:
    Given I am logged in as the following user 
      | email             | password  |
      | artist@foobar.com | Pass3Word |
  
  Scenario: Create new artist
    Given I am on the artist creation page for "artist@foobar.com"
    And I fill in "Name" with "Singer McSing"
    And I fill in "Description" with "Some descriptive text"
    And I press "Create Artist"
    Then I should see "Singer McSing"
