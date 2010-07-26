Feature: Sign in
  In order to access my account
  As a guest
  I want to sign in
  
  Background:
    Given I am on the sign in page
    
  Scenario: Sucessful sign in
    When I fill in "username" with "jeffmor"
      And fill in "password" with "secret"
      And press "Sign in"
    Then I should see "Signed in successfully"
    
  Scenario: Try with invalid username
    When I fill in "username" with "invalid"
      And press "Sign in"
    Then I should see "Invalid email or password"

  Scenario: Try with invalid password
    When I fill in "username" with "sauloarruda"
      And fill in "password" with "wrong"
      And press "Sign in"
    Then I should see "Invalid email or password"
  