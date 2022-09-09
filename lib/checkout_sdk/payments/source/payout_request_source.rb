module CheckoutSdk
  module Payments
    # @!attribute type
    #   @return [String] {PayoutSourceType}
    # @!attribute amount
    #   @return [String]
    class PayoutRequestSource
      attr_accessor :type,
                  :amount

      # @abstract
      # @param [String] type {PayoutSourceType}
      protected def initialize(type)
        @type = type
      end
    end
  end
end
