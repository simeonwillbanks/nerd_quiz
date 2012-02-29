module NerdQuiz
  class Scorecard
    RIGHT = :right
    WRONG = :wrong

    attr_reader :answers

    def initialize(possible=NerdQuiz::DEFAULT_NUMBER_OF_QUESTIONS)
      @answers = [].fill(nil, 0, possible)
    end

    def score
      "#{correct}/#{total}"
    end

    def right_answer!
      update RIGHT
    end

    def wrong_answer!
      update WRONG
    end

    private
    def update(answer)
      @answers[@answers.index(nil)] = answer
    end

    def correct
      @answers.select{|i| i == RIGHT}.length
    end

    def total
      @total ||= @answers.length
    end
  end
end
