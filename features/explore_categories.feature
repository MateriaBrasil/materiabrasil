Feature: Explore Categories
  In order to easily find categories
  As an user
  I want to explore categories

  Scenario: No category selected 
    Given a category called "Classes" exists
    When I visit the "explore_path"
    Then I should see "Classes"

  Scenario: A category with no parent is selected
    Given a category called "Classes" exists
    And a children category of "Classes" called "Composito" exists
    When I visit the "Classes" category path
    Then I should see "Classes"
    And I should see "Composito"

  Scenario: A category with a parent is selected
    Given a category called "Classes" exists
    And a children category of "Classes" called "Composito" exists
    And a children category of "Composito" called "Madeira" exists
    When I visit the "Composito" category path
    Then I should see "Classes"
    And I should see "Composito"
    And I should see "Madeira"
  
  Scenario: A category with a parent with a parent is selected
    Given a category called "Classes" exists
    And a children category of "Classes" called "Composito" exists
    And a children category of "Composito" called "Madeira" exists
    And a children category of "Madeira" called "stackoverflow" exists
    When I visit the "Madeira" category path
    Then I should see "Classes"
    And I should see "Composito"
    And I should see "Madeira"
    And I should see "stackoverflow"



