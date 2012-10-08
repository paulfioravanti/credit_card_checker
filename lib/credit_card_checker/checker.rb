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

    # def result
    #   {
    #     cc_type:   @cc_type,
    #     cc_number: @cc_number,
    #     validity:  @validity
    #   }
    # end

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
        # @validity = card_number_valid? ? "valid" : "invalid"
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

      # def card_number_valid?
      #   digits = @cc_number.chars.map(&:to_i)
      #   check = digits.pop

      #   sum = digits.reverse.each_slice(2).map do |left_digit, right_digit|
      #     [(left_digit * 2).divmod(10), right_digit]
      #   end.push(check).flatten.compact.inject(:+)

      #   sum % 10 == 0
      # end
    end
end