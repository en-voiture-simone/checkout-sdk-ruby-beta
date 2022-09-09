module CheckoutSdk
  module Payments
    # @!attribute type
    #   @return [String] {DestinationType}
    class Destination
      attr_accessor :type

      # @abstract
      # @param [String] type {DestinationType}
      protected def initialize(type)
        @type = type
      end
    end
  end
end