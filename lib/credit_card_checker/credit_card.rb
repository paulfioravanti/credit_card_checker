require 'active_model'

module CreditCardChecker
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