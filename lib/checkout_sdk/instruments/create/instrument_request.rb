module CheckoutSdk
  module DefaultSdk
    module Instruments
      # @!attribute type
      #   @return [String]
      class InstrumentRequest
        attr_reader :type

        # @abstract
        # @param [CheckoutSdk::Common::InstrumentType::String] type
        def initialize(type)
          @type = type
        end
      end
    end
  end
end
