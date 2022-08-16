require 'checkout_sdk/common/instrument_type'
require 'checkout_sdk/instruments/update/update_instrument_request'

module CheckoutSdk
  module DefaultSdk
    module Instruments
      class UpdateInstrumentTokenRequest < UpdateInstrumentRequest
        attr_accessor :token

        def initialize
          super CheckoutSdk::Common::InstrumentType::TOKEN
        end
      end

    end
  end
end
