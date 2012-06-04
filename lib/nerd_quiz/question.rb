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

    def label
      set
      @question[:label]
    end

    private

    def set
      if @question.empty?
        parse
        extract_text
        extract_answer
        extract_label
      end
    end

    def parse
      @parsed = Oj.load(File.new(@path, 'r'))["question"]
    end

    def extract_text
      text = []
      text << @parsed["text"]
      (1..4).each do |i|
        key = "a#{i}"
        # When the answer has significant whitespace, wrap the answer in quotes
        answer = @parsed[key] =~ /^\s/ || @parsed[key] =~ /\s$/ ? "\"#{@parsed[key]}\"" : @parsed[key]
        text << "#{i}) #{answer}"
      end
      @question[:text] = text.join("\n")
    end

    def extract_answer
      @question[:answer] = @parsed["right_answer"][1]
    end

    def extract_label
      label = []
      label << @parsed["category"]
      label << @parsed["sub_category"] unless @parsed["category"] == @parsed["sub_category"]
      @question[:label] = "(#{label.join(" - ")})"
    end
  end
end
