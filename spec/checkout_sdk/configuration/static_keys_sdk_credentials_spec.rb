require 'checkout_sdk/authorization_type'
require 'checkout_sdk/sdk_credentials'
require 'checkout_sdk/static_keys_sdk_credentials'

RSpec.describe "StaticKeysSdkCredentials" do

  context "build correctly sdk credentials" do
    it "should retrieve secret key authorization" do
      creds = CheckoutSdk::StaticKeysSdkCredentials.new("secret", "public")
      expect(creds).not_to be nil
      expect(creds.class).to eq(CheckoutSdk::StaticKeysSdkCredentials)
      expect(creds.get_authorization(CheckoutSdk::AuthorizationType::SECRET_KEY)).not_to be nil
    end

    it "should retrieve public key authorization" do
      creds = CheckoutSdk::StaticKeysSdkCredentials.new("secret", "public")
      expect(creds).not_to be nil
      expect(creds.class).to eq(CheckoutSdk::StaticKeysSdkCredentials)
      expect(creds.get_authorization(CheckoutSdk::AuthorizationType::PUBLIC_KEY)).not_to be nil
    end
  end
end