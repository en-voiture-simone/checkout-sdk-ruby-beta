module CheckoutSdk
  module Payments
    # @!attribute type
    #   @return [String] {SenderType}
    # @!attribute reference
    #   @return [String]
    class Sender
      attr_accessor :type,
                    :reference

      # @abstract
      # @param [String] type {SenderType}
      protected def initialize(type)
        @type = type
      end
    end
  end
end