module CheckoutSdk
  module Payments
    class Payer
      # @!attribute name
      #   @return [String]
      # @!attribute email
      #   @return [String]
      # @!attribute document
      #   @return [String]
      attr_accessor :name,
                    :email,
                    :document
    end
  end
end