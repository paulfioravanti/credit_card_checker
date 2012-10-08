require 'active_model'

module CreditCardChecker
  # Validator for credit card numbers using the Luhn algorithm
  class CardNumberValidator
    include ActiveModel::Validations

    attr_reader :number_array

    def initialize(number)
      @number_array = number.chars.map(&:to_i)
    end

    def number_valid?
      check = @number_array.pop

      sum = @number_array.reverse.each_slice(2).map do |left_num, right_num|
        [(left_num * 2).divmod(10), right_num]
      end.push(check).flatten.compact.inject(:+)

      sum % 10 == 0
    end

  end
end