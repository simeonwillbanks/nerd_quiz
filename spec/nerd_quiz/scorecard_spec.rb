require 'spec_helper'

module NerdQuiz
  describe Scorecard do
    subject { Scorecard.new }

    it 'persists the quiz answers' do
      subject.should respond_to :answers
    end

    it 'initiates the possible answers' do
      Scorecard.new(15).answers.should have(15).items
    end

    it 'sets a default possible answers when a default is not available' do
      subject.answers.should have(10).items
    end

    it 'knows the score' do
      subject.score.should eq('0/10')
    end

    it 'when an answer is right, the score changes' do
      sc = subject
      expect {
        sc.right_answer!
      }.to change { sc.score }.to('1/10')
    end

    it 'when an answer is wrong, the score stays the same' do
      sc = subject
      sc.wrong_answer!
      sc.score.should eq('0/10')
    end
  end
end
