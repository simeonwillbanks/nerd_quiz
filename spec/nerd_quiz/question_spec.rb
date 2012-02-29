require 'spec_helper'

module NerdQuiz
  describe Question do
    describe '.get' do
      subject { Question.get }

      it 'gets a new question' do
        subject.should be_a Question
      end

      it 'which includes the question text' do
        subject.should respond_to :text
        subject.text.should be_a String
      end

      it 'and the the answer text' do
        subject.should respond_to :answer
        subject.answer.should be_a String
      end
    end
  end
end
