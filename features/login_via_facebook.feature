Feature: Login via Facebook
  In order to see all informations from the materials
  as an user
  I want to be able to login via facebook

  Scenario: I'm in the homepage
    Given I'm in the home page
    When I click on the link "Conecte-se"
    Then I should see "Olá Luiz Fonseca"
    And I should see "Você conectou-se com sucesso!"

