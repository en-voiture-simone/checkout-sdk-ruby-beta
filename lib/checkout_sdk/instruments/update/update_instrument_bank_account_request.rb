require 'checkout_sdk/common/instrument_type'
require 'checkout_sdk/instruments/update/update_instrument_request'

module CheckoutSdk
  module DefaultSdk
    module Instruments
      class UpdateInstrumentBankAccountRequest < UpdateInstrumentRequest
        attr_accessor :account_type, #common.AccountType
                      :account_number,
                      :bank_code,
                      :branch_code,
                      :iban,
                      :bban,
                      :swift_bic,
                      :currency, #common.Currency
                      :country, #common.Country
                      :processing_channel_id,
                      :account_holder, #common.AccountHolder
                      :bank, #common.BankDetails
                      :customer #UpdateCustomerRequest

        def initialize
          super CheckoutSdk::Common::InstrumentType::BANK_ACCOUNT
        end
      end

    end
  end
end
