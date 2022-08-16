module Helpers
  module SandboxTestFixture
    def default_sdk
      CheckoutSdk::builder
        .static_keys
        .with_secret_key(ENV['CHECKOUT_DEFAULT_SECRET_KEY'])
        .with_public_key(ENV['CHECKOUT_DEFAULT_PUBLIC_KEY'])
        .with_environment(CheckoutSdk::Environment.sandbox)
        .build
    end

  end
end