module CheckoutSdk
  module Payments
    class DLocalProcessingSettings
      # @!attribute country
      #   @return [String] {CheckoutSdk::Common::Country}
      # @!attribute payer
      #   @return [Payer]
      # @!attribute installments
      #   @return [DLocalInstallments]
      attr_accessor :country,
                    :payer,
                    :installments
    end
  end
end