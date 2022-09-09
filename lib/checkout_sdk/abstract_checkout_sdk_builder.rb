module CheckoutSdk
  class AbstractCheckoutSdkBuilder
    attr_accessor :environment, :http_client

    def with_environment(environment)
      @environment = environment
      self
    end

    def with_http_client(http_client)
      @http_client = http_client
      self
    end

    def build
      with_environment(Environment.sandbox) if environment.nil?
      if !http_client.nil? && !@http_client.instance_of?(Faraday::Connection)
        raise CheckoutArgumentException, 'HttpClient must be an instance of Faraday::Connection'
      end
    end
  end
end
