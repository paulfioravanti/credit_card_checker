require 'spec_helper'
require 'credit_card_checker'

describe CardNumberValidator do

  let(:card_number) { "4111111111111111" }
  let(:validator) { CardNumberValidator.new(card_number) }

  subject { validator }

  it "model attributes" do
    should respond_to(:number_array)
  end

  it "instance methods" do
    should respond_to(:number_valid?)
  end

  specify "initial state" do
    expect(validator).to be_valid
    expect(validator.number_array).to eq(card_number.chars.map(&:to_i))
  end

  # #number_valid? method tested in checker_spec.rb
end