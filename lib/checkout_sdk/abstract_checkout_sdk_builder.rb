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
      if environment.nil?
        with_environment(Environment.sandbox)
      end
      if !http_client.nil? && !@http_client.instance_of?(Faraday::Connection)
        raise CheckoutArgumentException.new 'HttpClient must be an instance of Faraday::Connection'
      end
    end

  end
end