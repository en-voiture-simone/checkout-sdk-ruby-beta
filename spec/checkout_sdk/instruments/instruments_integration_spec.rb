require 'rspec'
require 'checkout_sdk/common/account_holder'
require 'checkout_sdk/common/customer_request'
require 'checkout_sdk/tokens/card_token_request'
require 'checkout_sdk/instruments/create/customer_instrument_request'
require 'checkout_sdk/instruments/create/instrument_token_request'
require 'checkout_sdk/instruments/update/update_instrument_request'
require 'checkout_sdk/instruments/update/update_instrument_card_request'

RSpec.describe CheckoutSdk::DefaultSdk::Instruments do

  describe '.create' do
    context 'when requesting a card instrument token' do
      it 'returns a card instrument token' do
        account_holder = CheckoutSdk::Common::AccountHolder.new
        account_holder.first_name = 'John'
        account_holder.last_name = 'Smith'
        account_holder.billing_address = address
        account_holder.phone = phone

        request = CheckoutSdk::DefaultSdk::Instruments::InstrumentTokenRequest.new
        request.token = create_token.token
        request.account_holder = account_holder

        response = default_sdk.instruments_client.create(request)

        expect(response).not_to be nil
        expect(response.id).not_to be nil
        expect(response.type).to eq(CheckoutSdk::Common::InstrumentType::CARD)
        expect(response.expiry_month).not_to be nil
        expect(response.expiry_year).not_to be nil
        expect(response.scheme).not_to be nil
        expect(response.last4).not_to be nil
        expect(response.bin).not_to be nil
        expect(response.card_type).not_to be nil
        expect(response.card_category).not_to be nil
        expect(response.issuer_country).not_to be nil
      end
    end

    context 'when requesting card token instrument with missing data' do
      it 'raises an error' do
        request = CheckoutSdk::DefaultSdk::Instruments::InstrumentTokenRequest.new

        expect { default_sdk.instruments_client.create(request) }.to raise_error(CheckoutSdk::CheckoutApiException)
      end
    end
  end

  describe '.get' do
    context 'when fetching a valid instrument' do
      subject(:instrument) { create_card_token_instrument }
      it 'returns a valid card token instrument' do
        response = default_sdk.instruments_client.get(instrument.id)

        expect(response).not_to be nil
        expect(response.id).not_to be nil
        expect(response.type).to eq(CheckoutSdk::Common::InstrumentType::CARD)
        expect(response.expiry_month).not_to be nil
        expect(response.expiry_year).not_to be nil
        expect(response.scheme).not_to be nil
        expect(response.last4).not_to be nil
        expect(response.bin).not_to be nil
        expect(response.card_type).not_to be nil
        expect(response.card_category).not_to be nil
        expect(response.issuer_country).not_to be nil
      end
    end

    context 'when fetching inexistent instrument' do
      it 'raises an exception' do
        expect { default_sdk.instruments_client.get("not_found") }.to raise_error(CheckoutSdk::CheckoutApiException)
      end
    end
  end

  describe '.update' do
    before(:all) do
      @instrument = create_card_token_instrument
    end
    context 'when updating card token instrument' do
      it 'should update successfully' do
        request = CheckoutSdk::DefaultSdk::Instruments::UpdateInstrumentCardRequest.new
        request.expiry_month = 12
        request.expiry_year = 2030
        request.name = "New Name"

        response = default_sdk.instruments_client.update(@instrument.id, request)
        expect(response).not_to be nil
      end

      it 'should have new values for updated fields' do
        response = default_sdk.instruments_client.get(@instrument.id)

        expect(response).not_to be nil
        expect(response.expiry_month).to eq(12)
        expect(response.expiry_year).to eq(2030)
        expect(response.name).to eq("New Name")
      end
    end

    context 'when updating inexistent instrument' do
      it 'raises an exception' do
        expect { default_sdk.instruments_client.update("not_found", nil) }.to raise_error(CheckoutSdk::CheckoutApiException)
      end
    end
  end

  describe '.delete' do
    subject(:instrument) { create_card_token_instrument }
    context 'when deleting an existent instrument' do
      it 'should return http: 200' do
        response = default_sdk.instruments_client.delete(instrument.id)

        #TODO check for response status
      end
    end

    context 'when deleting an inexistent instrument' do
      it 'raises an error' do
        expect { default_sdk.instruments_client.delete('not_found') }.to raise_error(CheckoutSdk::CheckoutApiException)
      end
    end
  end

end

def create_token
  request = CheckoutSdk::Tokens::CardTokenRequest.new
  request.number = Helpers::DataFactory::CARD_NUMBER
  request.expiry_month = Helpers::DataFactory::EXPIRY_MONTH
  request.expiry_year = Helpers::DataFactory::EXPIRY_YEAR

  token = default_sdk.tokens_client.request_card_token(request)
  token
end

def create_card_token_instrument
  account_holder = CheckoutSdk::Common::AccountHolder.new
  account_holder.first_name = 'John'
  account_holder.last_name = 'Smith'
  account_holder.billing_address = address
  account_holder.phone = phone

  request = CheckoutSdk::DefaultSdk::Instruments::InstrumentTokenRequest.new
  request.token = create_token.token
  request.account_holder = account_holder

  default_sdk.instruments_client.create(request)
end