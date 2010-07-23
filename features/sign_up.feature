Feature: Sign Up
  In order to log pomodoris
  As a guest
  I want to sign up
  
  Background:
    Given I am on the sign up page
  
  Scenario: Sucessful sign up
    When I fill in "username" with "sauloarruda"
      And fill in "email" with "saulo@jera.com.br"
      And fill in "password" with "secret"
      And fill in "password confirmation" with "secret"
      And press "Sign up"
    Then I should see "You have signed up successfully"
    
  Scenario: Try without required fields
    When I press "Sign up"
    Then I should see "3 errors prohibited this user from being saved"
      And should see "Username can't be blank"
      And should see "Email can't be blank"
      And should see "Password can't be blank"
      
  Scenario: Try with duplicated username
    Given the existence of "sauloarruda" user
    When I fill in "username" with "sauloarruda"
      And press "Sign up"
    Then I should see "Username has already been taken"
    
  Scenario: Try with invalid e-mail
    When I fill in "email" with "invalid@email"
      And press "Sign up"
    Then I should see "Email is invalid"
    

  Scenario: Try with wrong password confirmation
    When I fill in "password" with "secret"
      And fill in "password confirmation" with "wrong"
      And press "Sign up"
    Then I should see "Password doesn't match confirmation"
    
  Scenario: Try with short password confirmation
    When I fill in "password" with "aaaaa"
      And press "Sign up"
    Then I should see "Password is too short (minimum is 6 characters)"
  
  