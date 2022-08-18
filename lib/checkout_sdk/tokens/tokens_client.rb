module CheckoutSdk
  module Tokens
    class TokensClient < Client
      TOKENS = 'tokens'
      private_constant :TOKENS

      def initialize(api_client, configuration)
        super(api_client, configuration, CheckoutSdk::AuthorizationType::PUBLIC_KEY)
      end

      def request_card_token(card_token_request)
        api_client.invoke_post(TOKENS, sdk_authorization, card_token_request)
      end


    end
  end
end
