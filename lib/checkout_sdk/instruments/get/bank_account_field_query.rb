module CheckoutSdk
  module DefaultSdk
    module Instruments
      class BankAccountFieldQuery
        attr_accessor :account_holder_type, #common.AccountHolderType
                      :payment_network #PaymentNetwork
      end

    end
  end
end
