module CheckoutSdk
  module Payments
    # @!attribute type
    #   @return [String] {CheckoutSdk::Common::PaymentSourceType}
    class PaymentRequestSource
      attr_reader :type

      # @param [String] type {CheckoutSdk::Common::PaymentSourceType}
      protected def initialize(type)
        @type = type
      end
    end
  end
end
