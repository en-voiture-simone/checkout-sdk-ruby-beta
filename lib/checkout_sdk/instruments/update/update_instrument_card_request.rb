require 'checkout_sdk/common/instrument_type'
require 'checkout_sdk/instruments/update/update_instrument_request'

module CheckoutSdk
  module DefaultSdk
    module Instruments
      class UpdateInstrumentCardRequest < UpdateInstrumentRequest
        attr_accessor :expiry_month,
                      :expiry_year,
                      :name,
                      :account_holder, #common.AccountHolder
                      :customer #UpdateCustomerRequest

        def initialize
          super CheckoutSdk::Common::InstrumentType::CARD
        end
      end

    end
  end
end
