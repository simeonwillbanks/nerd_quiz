module NerdQuiz
  class Question
    class << self
      def get
        self.new
      end
    end

    def initialize
      @question = list.sample
    end

    def text
      @question[:question]
    end

    def answer
      @question[:answer]
    end

    private
    def list
      [
        {:question => "What is the acronym JSON an abbreviation for?", :answer => "JavaScript Object Notation"}
      ]
    end
  end
end
