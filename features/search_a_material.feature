Feature: Search Materials
  In order to find materials of my interest
  As an user
  I want to find materials

  @javascript
  Scenario: A material exists
    Given a category called "Classes" exists
    And a children category of "Classes" called "Composito" exists
    And a children category of "Composito" called "Com Fibra Natural" exists
    And a material named "Fibra de Coco" with category "Com Fibra Natural", "Composito", "Classes" exists
    And I'm in the home page
    When I fill in the search field with "coco"
    And I submit the search form
    Then I should see "Fibra de Coco"
    Then I should see "1 material encontrado"
