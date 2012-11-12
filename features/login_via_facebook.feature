Feature: Login via Facebook
  In order to see all informations from the materials
  as an user
  I want to be able to login via facebook

  @javascript @omniauth
  Scenario: I'm in the homepage
    Given I'm in the home page
    When I click on the link "Conecte"
    And I click on the link "Entre com sua conta do facebook"
    Then I should see "Desconectar"

