Feature: Nerd quiz ends a quiz after 10 questions

  As a Nerd Quiz
  I want to end the quiz after 10 questions
  So that I may tally the final score
  And either exit or start a new quiz

  Scenario: 10th question answered
    Given I receive an answered question
    And the question is the 10th
    When I score the question
    Then I complete the quiz
    And I ask the quizer, "Would you like to take another quiz?"

  Scenario: 10 questions answered correctly
    Given I receive 10 correct answers
    When I complete the quiz 
    Then I display "100% correct"

  Scenario: 8 questions answered correctly
    Given I receive 8 correct answers
    When I complete the quiz 
    Then I display "80% correct"
