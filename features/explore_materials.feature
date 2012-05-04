Feature: Explore Materials
  In order to easily find materials
  As an user
  I want to explore materials
  
  Scenario: One material belongs to 3 categories and none of them have siblings
    Given a category called "Classes" exists
    And a children category of "Classes" called "Composito" exists
    And a children category of "Composito" called "Com Fibra Natural" exists
    And a material named "Material de Fibra Natural" with category "Com Fibra Natural", "Composito", "Classes" exists
    When I visit the "Composito" category path
    Then I should see "Classes"
    Then I should see "Composito"
    Then I should see "Com Fibra Natural"
    Then I should see "Material de Fibra Natural"
    Then I should see the "Material de Fibra Natural" image
  
