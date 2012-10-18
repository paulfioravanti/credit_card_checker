require 'spec_helper'

describe CLI do

  let(:cli) { CLI.new }

  subject { cli }

  it "model attributes" do
    should respond_to(:result)
  end

  it "instance methods" do
    should respond_to(:check)
  end

  describe "#check with options[:filename]" do
    let(:default_file) { "credit_cards.txt" }
    let(:data) { test_data }
    let(:result) { expected_result }
    let(:output) { capture(:stdout) { cli.check } }

    it "parses the file contents and outputs a result" do
      File.stub(:readlines).with(default_file) { StringIO.new(data) }
      output.should == result
    end
  end
end