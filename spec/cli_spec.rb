require 'spec_helper'

describe CLI do

  let(:cli) { CLI.new }

  subject { cli }

  describe "model attributes" do
    it { should respond_to(:credit_card_numbers) }
    it { should respond_to(:output) }
  end

  describe "instance methods" do
    it { should respond_to(:check) }
  end

  describe "checking credit card numbers" do
    let(:default_file) { "credit_cards.txt" }
    let(:data) { test_data }
    let(:result) { expected_result }
    let(:output) { capture(:stdout) { cli.check } }

    it "should parse the file contents and output a result" do
      File.stub(:readlines).with(default_file) { StringIO.new(data) }
      output.should == result
    end
  end
end