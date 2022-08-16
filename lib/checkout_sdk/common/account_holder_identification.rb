module CheckoutSdk
  module Common
    class AccountHolderIdentification
      attr_accessor :type, #AccountHolderIdentificationType
                    :number,
                    :issuing_country, #Country
                    :date_of_expiry
    end

  end
end
