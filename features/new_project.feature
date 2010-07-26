Feature: New Project
  In order to organize activities into projects
  As an user
  I want to create a new project
  
  Background:
    Given I am signed in with "jeffmor" user
      And I am on the new project page
  
  Scenario: Sucessful created project
    When I fill in "name" with "Ketchup"
      And fill in "url" with "ketchup"
      And fill in "description" with "Pomodoro made easy!"
      And fill in "homepage" with "http://ketchup.jera.com.br"
      And press "Add project"
    Then I should see "Project was successfully created"
    