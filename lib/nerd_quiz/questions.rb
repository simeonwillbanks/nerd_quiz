module NerdQuiz
  class Questions
    class << self
      def get
        self.new
      end
    end

    PATTERN = File.expand_path('../../../NerdPursuit/questions/*.json', __FILE__)

    def initialize
      @questions = []
    end

    def pop
      questions.pop
    end

    private

    def questions
      find if @questions.empty?
      @questions
    end

    def find
      Dir.glob(PATTERN).sample(NerdQuiz::DEFAULT_NUMBER_OF_QUESTIONS).each do |q|
        @questions << NerdQuiz::Question.get(q)
      end
    end
  end
end
