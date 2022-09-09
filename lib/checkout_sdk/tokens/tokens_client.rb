module CheckoutSdk
  module Tokens
    class TokensClient < Client
      TOKENS = 'tokens'.freeze
      private_constant :TOKENS

      def initialize(api_client, configuration)
        super(api_client, configuration, CheckoutSdk::AuthorizationType::PUBLIC_KEY)
      end

      # @param [CardTokenRequest, WalletTokenRequest] token_request
      def request_token(token_request)
        api_client.invoke_post(TOKENS, sdk_authorization, token_request)
      end
    end
  end
end
