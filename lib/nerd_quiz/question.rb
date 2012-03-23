module NerdQuiz
  class Question
    class << self
      def get(path)
        self.new path
      end
    end

    def initialize(path)
      @path = path
      @question = {}
      @parsed = {}
    end

    def text
      set
      @question[:text]
    end

    def answer
      set
      @question[:answer]
    end

    private

    def set
      parse and extract if @question.empty?
    end

    def parse
      @parsed = Yajl::Parser.new.parse(File.new(@path, 'r'))
    end

    def extract
      parsed_question = @parsed["question"]
      question = []
      question << parsed_question["text"]
      (1..4).each do |i|
        key = "a#{i}"
        question << "#{key}) #{parsed_question[key]}"
      end
      @question[:text] = question.join("\n")
      @question[:answer] = parsed_question["right_answer"]
    end
  end
end
