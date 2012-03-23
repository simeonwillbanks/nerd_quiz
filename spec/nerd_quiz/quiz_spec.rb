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
      NerdQuiz::Question.stub(:get).and_return(mock(NerdQuiz::Question, :text => question, :answer => answer))
      subject.stub(:answer).and_return(answer)
    end

    describe '#run' do
      it 'sends a welcome message' do
        output.should_receive(:puts).with('Welcome to Nerd Quiz')
        subject.run
      end

      it 'asks all the questions' do
        subject.should_receive(:ask).exactly(10).times
        subject.run
      end

      it 'labels each question' do
        (1..10).each do |i|
          output.should_receive(:puts).with("Question #{i}:").once
        end
        subject.run
      end

      it 'listens for answers' do
        input.stub(:gets).and_return(answer)
        scorecard.should_receive(:incomplete?).and_return(true, true, true, true, true, true, true, true, true, true, false)
        subject.should_receive(:listen).exactly(10).times
        subject.run
      end

      it 'notifies it received the right answer' do
        subject.stub(:reply).and_return(answer)
        scorecard.should_receive(:incomplete?).and_return(true, true, true, true, true, true, true, true, true, true, false)
        output.should_receive(:puts).with('Right!').exactly(10).times
        subject.run
      end

      it 'tallies the right answer' do
        input.stub(:gets).and_return(answer, answer, answer, answer, answer, answer, answer, answer, answer, answer)
        scorecard.should_receive(:incomplete?).and_return(true, true, true, true, true, true, true, true, true, true, false)
        scorecard.should_receive(:right_answer!).exactly(10).times
        subject.run
      end

      it 'notifies it received the wrong answer' do
        scorecard.should_receive(:incomplete?).and_return(true, true, true, true, true, true, true, true, true, true, false)
        subject.stub(:reply).and_return('Pizza, of course')
        output.should_receive(:puts).with('Wrong!').exactly(10).times
        subject.run
      end

      it 'tallies the wrong answer' do
        input.stub(:gets).and_return('Pizza, of course', 'Pizza, of course', 'Pizza, of course', 'Pizza, of course', 'Pizza, of course', 'Pizza, of course', 'Pizza, of course', 'Pizza, of course', 'Pizza, of course', 'Pizza, of course')
        scorecard.should_receive(:incomplete?).and_return(true, true, true, true, true, true, true, true, true, true, false)
        scorecard.should_receive(:wrong_answer!).exactly(10).times
        subject.run
      end

      it 'proclaims the quiz over' do
        output.should_receive(:puts).with('Thanks For Playing!')
        subject.run
      end

      it 'displays the final score' do
        scorecard.stub(:score).and_return('10/10')
        output.should_receive(:puts).with('10/10')
        subject.run
      end
    end
  end
end
