require 'checkout_sdk/checkout_sdk_builder'

class StaticKeysBuilder < CheckoutSdkBuilder
  attr_accessor :secret_key
  attr_accessor :public_key

  def initialize
    super
  end

  def with_secret_key(secret_key)
    @secret_key = secret_key
  end

  def with_public_key(public_key)
    @public_key = public_key
  end

end

# TODO add keys validations

