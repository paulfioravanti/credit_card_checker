module CreditCardChecker
  module CheckerHelper

    def valid_card_types
      [
        {
          name: 'AMEX',
          pattern: /^3[47]/,
          valid_length: [15]
        },

        {
          name: 'Discover',
          pattern: /^6011/,
          valid_length: [16]
        },

        {
          name: 'Mastercard',
          pattern: /^5[1-5]/,
          valid_length: [16]
        },

        {
          name: 'VISA',
          pattern: /^4/,
          valid_length: [13, 16]
        }
      ]
    end

  end
end