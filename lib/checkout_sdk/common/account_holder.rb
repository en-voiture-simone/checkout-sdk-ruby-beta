module CheckoutSdk
  module Common
    class AccountHolder
      attr_accessor :type, #AccountHolderType
                    :first_name,
                    :last_name,
                    :company_name,
                    :tax_id,
                    :date_of_birth,
                    :country_of_birth, #Country
                    :residential_status,
                    :billing_address, #Address
                    :phone, #Phone
                    :identification, #AccountHolderIdentification
                    :email
    end
  end
end
