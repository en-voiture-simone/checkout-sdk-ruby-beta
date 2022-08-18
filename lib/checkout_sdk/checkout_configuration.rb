module CheckoutSdk
  class CheckoutConfiguration
    attr_accessor :credentials, :environment, :http_client

    def initialize(credentials, environment, http_client)
      @credentials = credentials
      @environment = environment
      @http_client = http_client
    end

  end
end