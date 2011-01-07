Feature: User authentication
  In order to identify a user at the website
  users should be able to sign up and in
  
  Background:
    Given the following user accounts
      | email            | password     |
      | one@signin.com   | unsafe       |
      | two@signin.com   | 123tEst.456! |
      | three@signin.com | Pass3Word    |
  
  Scenario Outline: Sign up
    Given I am not logged in
    When I follow "Sign up"
    And I fill in "Email" with "<email>"
    And I fill in "Password" with "123passw456"
    And I fill in "Password confirmation" with "123passw456"
    And I press "Sign up"
    Then I should see "You have signed up successfully"
    
    Examples:
      | email            |
      | one@signup.com   |
      | two@signup.com   |
      | three@signup.com |
      
  Scenario Outline: Sign in
    Given I am not logged in
    When I follow "Sign in"
    And I fill in "Email" with "<email>"
    And I fill in "Password" with "<password>"
    And I press "Sign in"
    Then I should see "Signed in successfully"
    
    Examples:
      | email            | password     |
      | one@signin.com   | unsafe       |
      | two@signin.com   | 123tEst.456! |
      | three@signin.com | Pass3Word    |
      
  Scenario: Sign out
    Given I am logged in
    When I follow "Log out"
    Then I should see "Signed out successfully"
  

  