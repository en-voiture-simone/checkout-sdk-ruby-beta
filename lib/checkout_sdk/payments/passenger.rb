module CheckoutSdk
  module Payments
    class Passenger
      # @!attribute name
      #   @return [String]
      # @!attribute date_of_birth
      #   @return [String]
      # @!attribute country_code
      #   @return [String] {CheckoutSdk::Common::Country}
      attr_accessor :name,
                    :date_of_birth,
                    :country_code
    end
  end
end