module CheckoutSdk
  module Payments
    class AirlineData
      # @!attribute ticket
      #   @return [Ticket]
      # @!attribute passenger
      #   @return [Passenger]
      # @!attribute flight_leg_details
      #   @return [Array(FlightLegDetails)]
      attr_accessor :ticket,
                    :passenger,
                    :flight_leg_details
    end
  end
end