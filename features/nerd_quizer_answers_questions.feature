Feature: Nerd quizer answers questions

  As a Nerd Quizer
  I want to answer questions
  So that I can increase my final score

  Scenario: answer question correctly
    Given I am asked the question "What is the acronym JSON an abbreviation for?"
    When I answer "JavaScript Object Notation"
    Then I should see my score increase by 1

  Scenario: answer question incorrectly
    Given I am asked the question "What is the acronym HTTP an abbreviation for?"
    When I answer "High Tea Today Please"
    Then I do not see my score change
