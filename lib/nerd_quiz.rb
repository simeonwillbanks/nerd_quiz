$LOAD_PATH.unshift(File.dirname(__FILE__)) if ARGV[0] == 'dev'
require 'nerd_quiz/version'
require 'nerd_quiz/quiz'
require 'nerd_quiz/question'
require 'nerd_quiz/scorecard'

module NerdQuiz
  DEFAULT_NUMBER_OF_QUESTIONS = 10
end
