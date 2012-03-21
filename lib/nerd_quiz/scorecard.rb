module NerdQuiz
  class Scorecard
    RIGHT = :right
    WRONG = :wrong

    attr_reader :answers

    def initialize(possible=NerdQuiz::DEFAULT_NUMBER_OF_QUESTIONS)
      @answers = [].fill(nil, 0, possible)
    end

    def next_question
      @answers.index(nil)
    end

    def incomplete?
      !next_question.nil?
    end

    def right_answer!
      update RIGHT
    end

    def wrong_answer!
      update WRONG
    end

    def score
      "#{correct}/#{total}"
    end

    private
    def update(answer)
      @answers[next_question] = answer
    end

    def correct
      @answers.select{|i| i == RIGHT}.length
    end

    def total
      @total ||= @answers.length
    end
  end
end
