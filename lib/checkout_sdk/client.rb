module CheckoutSdk
  class Client
    attr_reader :api_client, :authorization_type, :configuration
    protected :api_client, :authorization_type, :configuration

    def initialize(api_client, configuration, authorization_type)
      @api_client = api_client
      @authorization_type = authorization_type
      @configuration = configuration
    end

    protected def sdk_authorization(authorization_type = nil)
      if authorization_type.nil?
        configuration.credentials.get_authorization(@authorization_type)
      else
        configuration.credentials.get_authorization(authorization_type)
      end
    end

    protected def build_path(*args)
      args.join('/')
    end

  end
end
