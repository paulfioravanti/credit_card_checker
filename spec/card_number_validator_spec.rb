require 'spec_helper'
require 'credit_card_checker'

describe CardNumberValidator do

  let(:card_number) { "4111111111111111" }
  let(:validator) { CardNumberValidator.new(card_number) }

  subject { validator }

  describe "model attributes" do
    it { should respond_to(:number_array) }
  end

  describe "instance methods" do
    it { should respond_to(:number_valid?) }
  end

  describe "initial state" do
    it { should be_valid }
    its(:number_array) { should == card_number.chars.map(&:to_i) }
  end

  # number_valid? method tested in checker_spec.rb
end