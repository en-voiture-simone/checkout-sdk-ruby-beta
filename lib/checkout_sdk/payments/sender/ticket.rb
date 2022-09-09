module CheckoutSdk
  module Payments
    class Ticket
      # @!attribute number
      #   @return [String]
      # @!attribute issue_date
      #   @return [String]
      # @!attribute issuing_carrier_code
      #   @return [String]
      # @!attribute travel_agency_name
      #   @return [String]
      # @!attribute travel_agency_code
      #   @return [String]
      attr_accessor :number,
                    :issue_date,
                    :issuing_carrier_code,
                    :travel_agency_name,
                    :travel_agency_code
    end
  end
end