require 'rspec'
require 'checkout_sdk/tokens/card_token_request'

RSpec.describe CheckoutSdk::Tokens do

  context "request correctly a token" do
    it 'should request a card token' do
      default_sdk = CheckoutSdk::builder
                      .static_keys
                      .with_secret_key(ENV['CHECKOUT_DEFAULT_SECRET_KEY'])
                      .with_public_key(ENV['CHECKOUT_DEFAULT_PUBLIC_KEY'])
                      .with_environment(CheckoutSdk::Environment.sandbox)
                      .build

      request = CheckoutSdk::Tokens::CardTokenRequest.new
      request.number = '4242424242424242'
      request.expiry_month = 6
      request.expiry_year = 2025

      response = default_sdk.tokens_client.request_card_token(request)

      expect(default_sdk).not_to be nil
      expect(response).not_to be nil
      expect(response.token).not_to be nil
    end
  end
end
