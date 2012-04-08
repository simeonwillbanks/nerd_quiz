module NerdQuiz
  class Quiz
  include NerdQuiz::Color

    def initialize(input, output, scorecard)
      @input = input
      @output = output
      @scorecard = scorecard
      Signal.trap('INT', 'EXIT')
    end

    def run
      questions
      start
      while @scorecard.incomplete?
        ask
        listen
      end
      over
    ensure
      bye
    end

    private

    def bye
      out('Bye!', :blue, :bold)
    end

    def ask
      out("Question #{@scorecard.next_question + 1} #{label}:", :blue)
      out(question)
    end

    def listen
      if reply == answer
        out('Right!', :green, :bold)
        @scorecard.right_answer!
      else
        out('Wrong!', :red, :bold)
        # Do not nest ANSI sequences, so directly call set_color
        out(set_color('You should have answered ', :red) + set_color(answer, :red, true))
        @scorecard.wrong_answer!
      end
    end

    def reply
      @input.gets.strip
    end

    def start
      out('Welcome to Nerd Quiz', :blue)
    end

    def over
      out('Thanks For Playing!', :blue)
      out("Final Score #{@scorecard.score}", :yellow)
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

    def out(*args)
      text = args[0]
      unless args[1].nil?
        color = args[1] || false
        bold = args[2].is_a?(Symbol) ? true : false
        text = set_color(text, color, bold)
      end
      @output.puts text
    end
  end
end
