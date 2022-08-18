require 'checkout_sdk/tokens/tokens_client'

module CheckoutSdk
  module DefaultSdk
    class CheckoutApi
      attr_reader :tokens_client

      def initialize(configuration)
        api_client = base_api_client(configuration)
        @tokens_client = CheckoutSdk::Tokens::TokensClient.new(api_client, configuration)
      end

      private def base_api_client(configuration)
        CheckoutSdk::ApiClient.new(configuration, configuration.environment.base_uri)
      end

    end
  end
end
