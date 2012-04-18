require 'spec_helper'

module NerdQuiz
  describe Quiz do
    let(:question)  { 'What is the answer to life, the universe and everything?' }
    let(:answer)    { '42' }
    let(:label)     { '(culture)' }
    let(:output)    { double('output', :send => "").as_null_object }
    let(:input)     { double('input').as_null_object }
    let(:scorecard) { NerdQuiz::Scorecard.new }
    subject         { Quiz.new(input, output, scorecard) }

    before(:each) do
      subject.stub(:questions).and_return(nil)
      subject.stub(:label).and_return(label)
      subject.stub(:question).and_return(question)
      subject.stub(:answer).and_return(answer)
    end

    describe '#run' do
      # Only public API is the run loop, so it must be run for each test
      after(:each) do
        subject.run
      end

      it 'loads all the questions' do
        subject.should_receive(:questions).once
      end

      it 'sends a welcome message' do
        output.should_receive(:send).with(:puts, "\e[34mWelcome to Nerd Quiz\e[0m")
      end

      it 'asks all the questions' do
        subject.should_receive(:ask).exactly(10).times
      end

      it 'labels each question' do
        (1..10).each do |i|
          output.should_receive(:send).with(:puts, "\e[34mQuestion #{i} (culture):\e[0m").once
        end
      end

      context 'simulate run loop' do
        before(:each) do
          scorecard.stub(:incomplete?).and_return(true, true, true, true, true, true, true, true, true, true, false)
        end

        context 'right answer' do
          before(:each) do
            subject.stub(:reply).and_return(answer)
          end

          it 'listens for answers' do
            subject.should_receive(:listen).exactly(10).times
          end

          it 'notifies it received the right answer' do
            output.should_receive(:send).with(:puts, "\e[1m\e[32mRight!\e[0m").exactly(10).times
          end

          it 'tallies the right answer' do
            scorecard.should_receive(:right_answer!).exactly(10).times
          end
        end

        context 'wrong answer' do
          before(:each) do
            subject.stub(:reply).and_return('Pizza, of course')
          end

          it 'notifies it received the wrong answer' do
            output.should_receive(:send).with(:puts, "\e[1m\e[31mWrong!\e[0m").exactly(10).times
          end

          it 'and displays the right answer' do
            output.should_receive(:send).with(:puts, "\e[31mYou should have answered \e[0m\e[1m\e[31m42\e[0m").exactly(10).times
          end

          it 'tallies the wrong answer' do
            scorecard.should_receive(:wrong_answer!).exactly(10).times
          end
        end
      end

      it 'proclaims the quiz over' do
        output.should_receive(:send).with(:puts, "\e[34mThanks For Playing!\e[0m")
      end

      it 'displays the final score' do
        scorecard.stub(:score).and_return('10/10')
        output.should_receive(:send).with(:puts, "\e[33mFinal Score 10/10\e[0m")
      end

      it 'always says bye' do
        output.should_receive(:send).with(:puts, "\e[1m\e[34mBye!\e[0m")
      end

      it 'catches SIGINTs' do
        Signal.should_receive(:trap).with('INT', 'EXIT').once
      end
    end

    it 'exits when sent Ctrl-D (EOF)' do
      lambda {
        input.stub(:gets).and_return(nil)
        output.should_receive(:send).with(:puts, "\e[1m\e[34mBye!\e[0m")
        subject.run
      }.should raise_error(SystemExit)
    end
  end
end
