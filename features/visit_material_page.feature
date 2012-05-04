Feature: Show a material
  In order to know more about a material
  As an user
  I want visit the material page

  @javascript
  Scenario: Visit the material page
    Given a category called "Classes" exists
    And a children category of "Classes" called "Composito" exists
    And a children category of "Composito" called "Com Fibra Natural" exists
    And a material named "My Material" with category "Com Fibra natural", "Composito", "Classes" exists
    When I visit the "Classes" category path
    And I click on the link "My Material"
    Then I should be in "My Material" material path
    Then I should see the "My Material" name
    Then I should see the "My Material" image
