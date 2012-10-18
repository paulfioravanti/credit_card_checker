require 'active_model'
require 'credit_card_checker/checker_helper'
require 'credit_card_checker/card_number_validator'

module CreditCardChecker
  # Determines validity of a credit card
  class Checker
    include ActiveModel::Validations
    include CheckerHelper

    attr_accessor :cc_number, :cc_type, :validity

    def check(credit_card)
      @cc_number = credit_card.number
      validate_card_type
      determine_validity
      result
    end

    private

      def validate_card_type
        valid_card_types.each do |type|
          if card_type_matches?(type)
            @cc_type = type[:name]
            return
          end
        end
        @cc_type = "Unknown"
      end

      def card_type_matches?(type)
        @cc_number =~ type[:pattern] &&
          type[:valid_length].include?(@cc_number.length)
      end

      def determine_validity
        validator = CardNumberValidator.new(@cc_number)
        @validity = validator.number_valid? ? "valid" : "invalid"
      end

      def result
        {
          cc_type:   @cc_type,
          cc_number: @cc_number,
          validity:  @validity
        }
      end
    end
end