require 'spec_helper'

module NerdQuiz
  describe Quiz do
    let(:question)  { 'What is the answer to life, the universe and everything?' }
    let(:answer)    { '42' }
    let(:output)    { double('output').as_null_object }
    let(:input)     { double('input').as_null_object }
    let(:scorecard) { NerdQuiz::Scorecard.new }
    subject         { Quiz.new(input, output, scorecard) }

    before(:each) do
      NerdQuiz::Question.stub(:get).and_return(mock(NerdQuiz::Question, :question => question, :answer => answer))
    end

    describe '#start' do
      it 'sends a welcome message' do
        output.should_receive(:puts).with('Welcome to Nerd Quiz')
        subject.start
      end

      it 'asks the first question' do
        output.should_receive(:puts).with('Question 1:')
        subject.start
      end

      it 'via the first call to #continue' do
        subject.should_receive(:continue)
        subject.start
      end
    end

    describe '#ask' do
      it 'sends the question text' do
        output.should_receive(:puts).with(question)
        subject.ask(1)
      end

      it 'and includes the current question number' do
        output.should_receive(:puts).with('Question 5:')
        subject.ask(5)
      end
    end

    describe '#continue' do
      it 'decides to ask another question' do
        subject.stub(:questions).and_return([nil])
        subject.should_receive(:ask)
        subject.continue
      end
      it 'ends the quiz after last question' do
        subject.stub(:current).and_return(nil)
        subject.should_receive(:over)
        subject.continue
      end
    end

    describe '#over' do
      it 'proclaims the quiz over' do
        output.should_receive(:puts).with('Thanks For Playing!')
        subject.over
      end
      it 'and displays the final score' do
        scorecard.stub(:score).and_return('10/10')
        output.should_receive(:puts).with('10/10')
        subject.over
      end
    end

    describe '#listen' do
      before(:each) do
        subject.stub(:answer).and_return(answer)
      end

      it 'receives the right question answer' do
        input.stub(:gets).and_return(answer)
        output.should_receive(:puts).with('Right!')
        subject.listen
      end

      it 'and tallies the right answer' do
        subject.stub(:reply).and_return(answer)
        scorecard.should_receive(:right_answer!)
        subject.listen
      end

      it 'receives the wrong question answer' do
        input.stub(:gets).and_return('Pizza, of course')
        output.should_receive(:puts).with('Wrong!')
        subject.listen
      end

      it 'and tallies the wrong answer' do
        subject.stub(:reply).and_return('Pizza, of course')
        scorecard.should_receive(:wrong_answer!)
        subject.listen
      end
    end
  end
end
