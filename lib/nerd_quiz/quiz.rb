module NerdQuiz
  class Quiz

    def initialize(input, output, scorecard, possible=NerdQuiz::DEFAULT_NUMBER_OF_QUESTIONS)
      @input = input
      @output = output
      @scorecard = scorecard
      @questions = [].fill(nil, 0, possible)
    end

    def start
      @output.puts 'Welcome to Nerd Quiz'
      continue
    end

    def current
      @questions.index(nil)
    end

    def continue
      unless current.nil?
        ask current + 1
      else
        over
      end
    end

    def ask(current)
      @output.puts "Question #{current}:"
      @output.puts question
    end

    def listen
      if reply == answer
        @output.puts 'Right!'
        @scorecard.right_answer!
      else
        @output.puts 'Wrong!'
        @scorecard.wrong_answer!
      end
      continue
    end

    def over
      @output.puts 'Thanks For Playing!'
      @output.puts @scorecard.score
    end

    private
    def question
      @question = NerdQuiz::Question.get
      @question.text
    end

    def answer
      @question.answer
    end

    def reply
      @input.gets
    end
  end
end
