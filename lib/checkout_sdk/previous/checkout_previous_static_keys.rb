require 'checkout_sdk/previous/checkout_api'

module CheckoutSdk
  module PreviousSdk
    class CheckoutPreviousStaticKeys < StaticKeysBuilder
      SECRET_KEY_PATTERN = '^sk_(test_)?(\\w{8})-(\\w{4})-(\\w{4})-(\\w{4})-(\\w{12})$'.freeze
      PUBLIC_KEY_PATTERN = '^pk_(test_)?(\\w{8})-(\\w{4})-(\\w{4})-(\\w{4})-(\\w{12})$'.freeze
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