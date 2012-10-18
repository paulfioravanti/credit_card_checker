require 'spec_helper'
require 'credit_card_checker'

describe CreditCard do

  let(:credit_card) { CreditCard.new("4111 1111 1111 1111") }

  subject { credit_card }

  it "model attributes" do
    should respond_to(:number)
  end

  describe "initial state" do
    it { should be_valid }
    its(:number) { should_not =~ /\s+/ }
  end

  describe "validations" do
    context "when number is not present" do
      before { credit_card.instance_variable_set(:@number, " ") }
      it { should_not be_valid }
    end

    context "when number is too short" do
      before { credit_card.instance_variable_set(:@number, "1" * 12) }
      it { should_not be_valid }
    end

    context "when number is too long" do
      before { credit_card.instance_variable_set(:@number, "1" * 17) }
      it { should_not be_valid }
    end

    context "when number is not an integer" do
      before { credit_card.instance_variable_set(:@number, "1" * 13 << ".1") }
      it { should_not be_valid }
    end

    context "when number is not a number" do
      before { credit_card.instance_variable_set(:@number, "Not a number!") }
      it { should_not be_valid }
    end
  end
end