require 'rspec'
require 'checkout_sdk/tokens/card_token_request'

RSpec.describe CheckoutSdk::Tokens do

  describe '.request_card_token' do
    context "when requesting a token with correct data" do
      it 'returns a valid card token' do
        request = CheckoutSdk::Tokens::CardTokenRequest.new
        request.number = Helpers::DataFactory::CARD_NUMBER
        request.expiry_month = Helpers::DataFactory::EXPIRY_MONTH
        request.expiry_year = Helpers::DataFactory::EXPIRY_YEAR

        response = default_sdk.tokens_client.request_card_token(request)

        expect(default_sdk).not_to be nil
        expect(response).not_to be nil
        expect(response.token).not_to be nil
      end
    end
  end

end
