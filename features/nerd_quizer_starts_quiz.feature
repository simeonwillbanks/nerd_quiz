Feature: Nerd quizer starts a quiz

  As a nerd quizer
  I want to start a quiz
  So that I can test my nerd cred

  Scenario: start quiz
    Given I am not yet taking a quiz
    When I start a new quiz
    Then I should see "Welcome to Nerd Quiz"
    And I should see "Question 1:"
