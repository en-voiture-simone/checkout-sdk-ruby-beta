require 'checkout_sdk/tokens/token_type'

module CheckoutSdk
  module Tokens
    class CardTokenRequest
      attr_accessor :type,
                    :number,
                    :expiry_month,
                    :expiry_year,
                    :name,
                    :cvv,
                    :billing_address,
                    :phone

      def initialize
        @type = TokenType::CARD
      end

    end
  end
end