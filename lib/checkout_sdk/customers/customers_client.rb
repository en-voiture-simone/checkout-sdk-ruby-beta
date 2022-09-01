module CheckoutSdk
  module DefaultSdk
    module Customers
      class CustomersClient < Client
        CUSTOMERS = 'customers'
        private_constant :CUSTOMERS

        def initialize(api_client, configuration)
          super(api_client, configuration, CheckoutSdk::AuthorizationType::SECRET_KEY_OR_OAUTH)
        end

        def create(customer_request)
          api_client.invoke_post(CUSTOMERS, sdk_authorization, customer_request)
        end

        def get(customer_id)
          api_client.invoke_get(build_path(CUSTOMERS, customer_id), sdk_authorization)
        end

        def update(customer_id, customer_request)
          api_client.invoke_patch(build_path(CUSTOMERS, customer_id), sdk_authorization, customer_request)
        end

        def delete(customer_id)
          api_client.invoke_delete(build_path(CUSTOMERS, customer_id), sdk_authorization)
        end
      end
    end
  end
end
