Feature: New Project
  In order to organize activities into projects
  As an user
  I want to create a new project
  
  Background:
    Given I am signed in with "jeffmor" user
      And I am on the new project page
  
  Scenario: Sucessful created project
    When I fill in "name" with "Tô Malhando"
      And fill in "url" with "ToMalhando"
      And fill in "description" with "Rede social de saúde e qualidade de vida"
      And fill in "homepage" with "http://www.tomalhando.com.br"
      And press "Add project"
    Then I should see "Project was successfully created"
    