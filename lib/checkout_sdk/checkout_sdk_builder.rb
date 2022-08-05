require 'checkout_sdk/configuration/environment'

class CheckoutSdkBuilder
  attr_accessor :environment

  # http_client

  def with_environment(environment)
    @environment = environment
  end

end
