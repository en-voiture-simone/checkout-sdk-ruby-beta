require 'checkout_sdk/common/instrument_type'
require 'checkout_sdk/instruments/create/instrument_request'

module CheckoutSdk
  module DefaultSdk
    module Instruments
      class InstrumentTokenRequest < InstrumentRequest
        attr_accessor :token,
                      :account_holder, #common.AccountHolder
                      :customer #CustomerInstrumentRequest

        def initialize
          super CheckoutSdk::Common::InstrumentType::TOKEN
        end
      end

    end
  end
end
