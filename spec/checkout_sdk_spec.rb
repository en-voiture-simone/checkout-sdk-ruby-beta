# frozen_string_literal: true

RSpec.describe CheckoutSdk do
  it "has a version number" do
    expect(CheckoutSdk::VERSION).not_to be nil
  end

  it "builds default_sdk properly" do
    default_sdk = CheckoutSdk::builder.build do |builder|
      builder.with_environment(Environment.production)
      builder.with_secret_key("secret")
      builder.with_public_key("public")
    end

    expect(default_sdk.class).to eq(CheckoutApi)
  end
end
