require 'spec_helper'

module NerdQuiz
  describe Question do
    describe '.get' do
      let(:path) { "/Users/simeon/Projects/nerd_quiz/NerdPursuit/questions/yo_dawg.json" }
      let(:text) do
        "Yo dawg, I herd you like ...\n" +
        "a1) music, so I put a tape in your pants so you can listen while you sleep!\n" +
        "a2) cars, so I put a car in your car so you can drive while you drive!\n" +
        "a3) cheating, so I put a bread in your bag so you can run while you eat!\n" +
        "a4) drinking, so I put a hat in your pocket so you can listen while you dance!"
      end
      let(:answer) { "a2" }

      subject { Question.get(path) }

      it 'gets a new question' do
        subject.should be_a Question
      end

      it 'which includes the question text' do
        subject.should respond_to :text
        subject.text.should be_a String
        subject.text.should eq(text)
      end

      it 'and the the answer text' do
        subject.should respond_to :answer
        subject.answer.should be_a String
        subject.answer.should eq(answer)
      end
    end
  end
end
