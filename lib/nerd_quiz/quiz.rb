module NerdQuiz
  class Quiz

    def initialize(input, output, scorecard)
      @input = input
      @output = output
      @scorecard = scorecard
    end

    def run
      start
      while @scorecard.incomplete?
        ask
        listen
      end
      over
    end

    private
    def ask
      @output.puts "Question #{@scorecard.next_question + 1}:"
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
    end

    def reply
      @input.gets.strip
    end

    def start
      @output.puts 'Welcome to Nerd Quiz'
    end

    def over
      @output.puts 'Thanks For Playing!'
      @output.puts @scorecard.score
    end

    def question
      @question = NerdQuiz::Question.get
      @question.text
    end

    def answer
      @question.answer
    end
  end
end
