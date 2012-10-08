require 'active_model'

module CreditCardChecker
  # Model for a basic credit card
  class CreditCard
    include ActiveModel::Validations

    attr_reader :number

    validates :number,  presence: true,
                        length: { minimum: 13, maximum: 16 },
                        numericality: { only_integer: true }

    def initialize(number)
      @number = number.gsub(/\s+/, "")
    end
  end
end