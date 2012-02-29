Feature: Nerd quiz asks questions

  As a Nerd Quiz
  I want to ask questions
  So that I can accept answers

  Scenario: ask question
    Given I am conducting a quiz
    When I ask the question "What is the acronym JSON an abbreviation for?"
    And A quizer answers "JavaScript Object Notation"
    Then I should mark the answer as "JavaScript Object Notation"
