require 'spec_helper'
require 'credit_card_checker'

describe Checker do

  let(:checker) { Checker.new }

  subject { checker }

  describe "model attributes" do
    it { should respond_to(:cc_number) }
    it { should respond_to(:cc_type) }
    it { should respond_to(:validity) }
  end

  describe "instance methods" do
    it { should respond_to(:check).with(1).argument }
    it { should respond_to(:result) }
  end

  describe "initial state" do
    it { should be_valid }
  end

  shared_examples_for "all credit cards" do
    let(:expected_result) do
      {
        cc_type: cc_type,
        cc_number: checker.cc_number,
        validity: validity
      }
    end
    its(:cc_number) { should == credit_card.number }
    its(:cc_type) { should == cc_type }
    its(:validity) { should == validity }
    its(:result) do
      should == expected_result
    end
  end

  describe "card validation" do

    context "for AMEX cards" do
      let(:cc_type) { 'AMEX' }

      context "that are valid" do
        let(:validity) { 'valid' }

        valid_test_amex_cards.each do |number|
          let(:credit_card) { CreditCard.new(number) }
          before { checker.check(credit_card) }
          it_should_behave_like "all credit cards"
        end
      end

      context "that are invalid" do
        let(:validity) { 'invalid' }

        invalid_test_amex_cards.each do |number|
          let(:credit_card) { CreditCard.new(number) }
          before { checker.check(credit_card) }
          it_should_behave_like "all credit cards"
        end
      end

    end

    context "for Discover cards" do
      let(:cc_type) { 'Discover' }

      context "that are valid" do
        let(:validity) { 'valid' }

        valid_test_discover_cards.each do |number|
          let(:credit_card) { CreditCard.new(number) }
          before { checker.check(credit_card) }
          it_should_behave_like "all credit cards"
        end
      end

      context "that are invalid" do
        let(:validity) { 'invalid' }

        invalid_test_discover_cards.each do |number|
          let(:credit_card) { CreditCard.new(number) }
          before { checker.check(credit_card) }
          it_should_behave_like "all credit cards"
        end
      end

    end

    context "for Mastercard cards" do
      let(:cc_type) { 'Mastercard' }

      context "that are valid" do
        let(:validity) { 'valid' }

        valid_test_mastercard_cards.each do |number|
          let(:credit_card) { CreditCard.new(number) }
          before { checker.check(credit_card) }
          it_should_behave_like "all credit cards"
        end
      end

      context "that are invalid" do
        let(:validity) { 'invalid' }

        invalid_test_mastercard_cards.each do |number|
          let(:credit_card) { CreditCard.new(number) }
          before { checker.check(credit_card) }
          it_should_behave_like "all credit cards"
        end
      end

    end

    context "for Visa cards" do
      let(:cc_type) { 'VISA' }

      context "that are valid" do
        let(:validity) { 'valid' }

        valid_test_visa_cards.each do |number|
          let(:credit_card) { CreditCard.new(number) }
          before { checker.check(credit_card) }
          it_should_behave_like "all credit cards"
        end
      end

      context "that are invalid" do
        let(:validity) { 'invalid' }

        invalid_test_visa_cards.each do |number|
          let(:credit_card) { CreditCard.new(number) }
          before { checker.check(credit_card) }
          it_should_behave_like "all credit cards"
        end
      end
    end

    context "for Unknown cards" do
      let(:cc_type) { 'Unknown' }

      context "that are valid" do
        let(:validity) { 'valid' }

        valid_test_unknown_cards.each do |number|
          let(:credit_card) { CreditCard.new(number) }
          before { checker.check(credit_card) }
          it_should_behave_like "all credit cards"
        end
      end

      context "that are invalid" do
        let(:validity) { 'invalid' }

        invalid_test_unknown_cards.each do |number|
          let(:credit_card) { CreditCard.new(number) }
          before { checker.check(credit_card) }
          it_should_behave_like "all credit cards"
        end
      end

    end
  end
end