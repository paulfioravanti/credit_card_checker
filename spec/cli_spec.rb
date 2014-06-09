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
      allow(File).to \
        receive(:readlines).with(default_file).and_return(StringIO.new(data))
      expect(output).to eq(result)
    end
  end
end