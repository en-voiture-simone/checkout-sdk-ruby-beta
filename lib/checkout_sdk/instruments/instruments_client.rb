module CheckoutSdk
  module DefaultSdk
    module Instruments
      class InstrumentsClient < Client
        INSTRUMENTS = 'instruments'
        VALIDATION = 'validation/bank-accounts'
        private_constant :INSTRUMENTS, :VALIDATION

        def initialize(api_client, configuration)
          super(api_client, configuration, CheckoutSdk::AuthorizationType::SECRET_KEY_OR_OAUTH)
        end

        def create(create_instrument_request)
          api_client.invoke_post(INSTRUMENTS, sdk_authorization, create_instrument_request)
        end

        def get(instrument_id)
          api_client.invoke_get(build_path(INSTRUMENTS, instrument_id), sdk_authorization)
        end

        def update(instrument_id, update_instrument_request)
          api_client.invoke_patch(
            build_path(INSTRUMENTS, instrument_id),
            sdk_authorization,
            update_instrument_request)
        end

        def delete(instrument_id)
          api_client.invoke_delete(build_path(INSTRUMENTS, instrument_id), sdk_authorization)
        end

        def get_bank_account_field_formatting(country, currency, bank_account_field_query)
          # TODO implement when OAuth is ready
        end

      end
    end
  end
end
