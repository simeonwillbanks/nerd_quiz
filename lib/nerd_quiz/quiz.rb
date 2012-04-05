module NerdQuiz
  class Quiz
  include NerdQuiz::Color

    def initialize(input, output, scorecard)
      @input = input
      @output = output
      @scorecard = scorecard
    end

    def run
      questions
      start
      while @scorecard.incomplete?
        ask
        listen
      end
      over
    end

    private
    def ask
      @output.puts set_color("Question #{@scorecard.next_question + 1} #{label}:", :blue)
      @output.puts question
    end

    def listen
      if reply == answer
        @output.puts set_color('Right!', :green, true)
        @scorecard.right_answer!
      else
        @output.puts set_color('Wrong!', :red, true)
        @output.puts set_color('You should have answered ', :red) + set_color(answer, :red, true)
        @scorecard.wrong_answer!
      end
    end

    def reply
      @input.gets.strip
    end

    def start
      @output.puts set_color('Welcome to Nerd Quiz', :blue)
    end

    def over
      @output.puts set_color('Thanks For Playing!', :blue)
      @output.puts set_color("Final Score #{@scorecard.score}", :yellow)
    end

    def questions
      @questions = NerdQuiz::Questions.get
    end

    def label
      @question = @questions.pop
      @question.label
    end

    def question
      @question.text
    end

    def answer
      @question.answer
    end
  end
end
