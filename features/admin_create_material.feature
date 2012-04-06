Feature: Create a Material
  In order to show my materials on the frontend listing
  As an admin
  I want to create a material

  @javascript
  Scenario: When I submit the form without images
    Given I'm an admin and I'm logged In
    And 2 category exists
    And 1 manufacturer exists
    And I click "Materiais"
    And I click "Crie uma"
    Then I should be in "new_admin_material_path"
    And I chose 1 manufacturer
    And I chose 1 category
    And I fill "Resumo" with "abc"
    And I fill "Observações Técnicas" with "abc"
    And I fill "Densidade" with "abc"
    And I fill "Dimensões" with "abc"
    And I fill "Embalagem" with "abc"
    And I fill "Preço Médio" with "abc"
    And I click "Adicionar Novo(a) Image"
    And I fill "Title" with "abc"
    And I fill "Description" with "abc"
    And I check "Featured"
    When I click "Create Material"
    Then I should see "Detalhes do(a) Material"
