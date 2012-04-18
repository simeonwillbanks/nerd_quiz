require 'spec_helper'

module NerdQuiz
  describe Question do
    describe '.get' do
      let(:path) { File.expand_path('../../../NerdPursuit/questions/yo_dawg.json', __FILE__) }
      let(:text) do
        "Yo dawg, I herd you like ...\n" +
        "1) music, so I put a tape in your pants so you can listen while you sleep!\n" +
        "2) cars, so I put a car in your car so you can drive while you drive!\n" +
        "3) cheating, so I put a bread in your bag so you can run while you eat!\n" +
        "4) drinking, so I put a hat in your pocket so you can listen while you dance!"
      end
      let(:answer) { "2" }
      let(:label) { "(culture)" }

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
