require 'spec_helper'

module NerdQuiz
  describe Question do
    describe '.get' do
      let(:path) { File.expand_path('../../../NerdPursuit/questions/kernel-sprintf-2.json', __FILE__) }
      let(:text) do
        "What's the output of '%-020s' % 'dude is here'?\n" +
        "1) dude is here\n" +
        "2) \"dude is here        \"\n" +
        "3) \"        dude is here\"\n" +
        "4) dude is"
      end
      let(:answer) { "2" }
      let(:label) { "(backend - ruby)" }

      subject { Question.get(path) }

      it 'gets a new question' do
        subject.should be_a Question
      end

      it 'which includes the question text' do
        subject.should respond_to :text
        subject.text.should be_a String
        subject.text.should eq(text)
      end

      it 'and the the label text' do
        subject.should respond_to :label
        subject.label.should be_a String
        subject.label.should eq(label)
      end

      it 'and the the answer text' do
        subject.should respond_to :answer
        subject.answer.should be_a String
        subject.answer.should eq(answer)
      end
    end
  end
end
