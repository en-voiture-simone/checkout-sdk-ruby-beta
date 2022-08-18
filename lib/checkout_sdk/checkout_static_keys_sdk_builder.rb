require 'checkout_sdk/checkout_api'

module CheckoutSdk
  module DefaultSdk
    class CheckoutStaticKeysSdkBuilder < StaticKeysBuilder
      SECRET_KEY_PATTERN = '^sk_(sbox_)?[a-z2-7]{26}[a-z2-7*#$=]$'.freeze
      PUBLIC_KEY_PATTERN = '^pk_(sbox_)?[a-z2-7]{26}[a-z2-7*#$=]$'.freeze
      private_constant :SECRET_KEY_PATTERN, :PUBLIC_KEY_PATTERN

      def build
        @secret_key_pattern = SECRET_KEY_PATTERN
        @public_key_pattern = PUBLIC_KEY_PATTERN
        super
        CheckoutApi.new(
          CheckoutConfiguration.new(
            StaticKeysSdkCredentials.new(secret_key, public_key),
            environment,
            http_client))
      end

    end
  end
end