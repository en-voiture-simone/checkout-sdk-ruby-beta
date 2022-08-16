module CheckoutSdk
  module DefaultSdk
    module Instruments
      class UpdateInstrumentRequest
        attr_reader :type #common.InstrumentType

        def initialize(type)
          @type = type
        end
      end

    end
  end
end
