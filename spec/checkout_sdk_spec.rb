# frozen_string_literal: true
require 'checkout_sdk/environment'
require 'checkout_sdk/abstract_checkout_sdk_builder'
require 'checkout_sdk/checkout_sdk_builder'
require 'checkout_sdk/static_keys_builder'

RSpec.describe CheckoutSdk do

  context "it has some properties" do
    it "should has a version number" do
      expect(CheckoutSdk::VERSION).not_to be nil
    end
  end

  context "build correctly the default sdk" do
    it 'should built sdk with both keys' do
      default_sdk = CheckoutSdk::builder
                      .static_keys
                      .with_secret_key(ENV['CHECKOUT_DEFAULT_SECRET_KEY'])
                      .with_public_key(ENV['CHECKOUT_DEFAULT_PUBLIC_KEY'])
                      .with_environment(CheckoutSdk::Environment.production)
                      .build
      expect(default_sdk.class).to eq(CheckoutSdk::DefaultSdk::CheckoutApi)
    end

    it 'should built sdk with secret key only' do
      default_sdk = CheckoutSdk::builder
                      .static_keys
                      .with_secret_key(ENV['CHECKOUT_DEFAULT_SECRET_KEY'])
                      .with_environment(CheckoutSdk::Environment.production)
                      .build
      expect(default_sdk.class).to eq(CheckoutSdk::DefaultSdk::CheckoutApi)
    end
  end

  context "fail during built the default sdk" do
    it 'should fail built with wrong secret key' do
      expect {
        CheckoutSdk::builder
          .static_keys
          .with_secret_key("my wrong key")
          .with_environment(CheckoutSdk::Environment.production)
          .build
      }.to raise_error(CheckoutSdk::CheckoutArgumentException)
    end

    it 'should fail built with wrong public key' do
      expect {
        CheckoutSdk::builder
          .static_keys
          .with_secret_key(ENV['CHECKOUT_DEFAULT_SECRET_KEY'])
          .with_public_key("my wrong key")
          .with_environment(CheckoutSdk::Environment.production)
          .build
      }.to raise_error(CheckoutSdk::CheckoutArgumentException)
    end
  end

  context "build correctly the previous sdk" do
    it 'should built sdk with both keys' do
      default_sdk = CheckoutSdk::builder
                      .previous
                      .static_keys
                      .with_secret_key(ENV['CHECKOUT_PREVIOUS_SECRET_KEY'])
                      .with_public_key(ENV['CHECKOUT_PREVIOUS_PUBLIC_KEY'])
                      .with_environment(CheckoutSdk::Environment.production)
                      .build
      expect(default_sdk.class).to eq(CheckoutSdk::PreviousSdk::CheckoutApi)
    end

    it 'should built sdk with secret key only' do
      default_sdk = CheckoutSdk::builder
                      .previous
                      .static_keys
                      .with_secret_key(ENV['CHECKOUT_PREVIOUS_SECRET_KEY'])
                      .with_environment(CheckoutSdk::Environment.production)
                      .build
      expect(default_sdk.class).to eq(CheckoutSdk::PreviousSdk::CheckoutApi)
    end
  end

  context "fail during built the previous sdk" do
    it 'should fail built with wrong secret key' do
      expect {
        CheckoutSdk::builder
          .previous
          .static_keys
          .with_secret_key("my wrong key")
          .with_environment(CheckoutSdk::Environment.production)
          .build
      }.to raise_error(CheckoutSdk::CheckoutArgumentException)
    end

    it 'should fail built with wrong public key' do
      expect {
        CheckoutSdk::builder
          .previous
          .static_keys
          .with_secret_key(ENV['CHECKOUT_PREVIOUS_SECRET_KEY'])
          .with_public_key("my wrong key")
          .with_environment(CheckoutSdk::Environment.production)
          .build
      }.to raise_error(CheckoutSdk::CheckoutArgumentException)
    end
  end
end
