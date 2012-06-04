$LOAD_PATH.unshift(File.dirname(__FILE__)) if ARGV[0] == 'dev'
require 'oj'
%w{ version color quiz question questions scorecard }.each do |f|
  require 'nerd_quiz/' + f
end

module NerdQuiz
  DEFAULT_NUMBER_OF_QUESTIONS = 10
end
