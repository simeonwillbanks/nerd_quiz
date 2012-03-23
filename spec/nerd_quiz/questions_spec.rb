require 'spec_helper'

module NerdQuiz
  describe Questions do
    subject { Questions.get }

    describe '.get' do
      it 'gets a new question' do
        subject.should be_a Questions
      end
    end

    describe '#pop' do
      it 'returns a Question' do
        subject.pop.should be_a Question
      end

      it 'and it decreases the number of questions by one' do
        expect {
          subject.pop
        }.to change { subject.send(:questions).size }.by(-1)
      end
    end

    describe '#find' do
      it 'finds questions from NerdPursuit' do
        Dir.should_receive(:glob).with(Questions::PATTERN).once.and_return([])
        subject.pop
      end

      it 'loads found questions' do
        questions = Questions.get
        questions.send(:questions).size.should eq(NerdQuiz::DEFAULT_NUMBER_OF_QUESTIONS)
      end
    end
  end
end
