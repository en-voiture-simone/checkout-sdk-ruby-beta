require 'checkout_sdk/checkout_api'
require 'checkout_sdk/configuration/sdk_configuration'
require 'checkout_sdk/configuration/default_keys_credentials'
require 'checkout_sdk/static_keys_builder'

class DefaultSdk < StaticKeysBuilder
  def initialize
    super
  end

  def self.build
    builder = new
    yield(builder)

    configuration = SdkConfiguration.new(
      DefaultKeysCredentials.new(builder.secret_key, builder.public_key),
      builder.environment)

    CheckoutApi.new(configuration)
  end

end
