module CheckoutSdk
  module Tokens
    class ApplePayTokenData
      # @!attribute version
      #   @return [String]
      # @!attribute data
      #   @return [String]
      # @!attribute signature
      #   @return [String]
      # @!attribute header
      #   @return [Hash{String => Object]
      attr_accessor :version,
                    :data,
                    :signature,
                    :header
    end
  end
end