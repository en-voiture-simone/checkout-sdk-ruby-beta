require 'checkout_sdk/common/instrument_type'
require 'checkout_sdk/instruments/create/instrument_request'

module CheckoutSdk
  module DefaultSdk
    module Instruments
      class InstrumentTokenRequest < InstrumentRequest
        # @!attribute token
        #   @return [String]
        # @!attribute account_holder
        #   @return [CheckoutSdk::Common::AccountHolder]
        # @!attribute customer
        #   @return [CheckoutSdk::Common::CustomerRequest]
        attr_accessor :token,
                      :account_holder,
                      :customer

        def initialize
          super CheckoutSdk::Common::InstrumentType::TOKEN
        end
      end
    end
  end
end
