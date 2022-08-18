module CheckoutSdk
  class CheckoutException < StandardError
    def initialize(message)
      super(message)
    end
  end

  class CheckoutArgumentException < CheckoutException; end

  class CheckoutAuthorizationException < CheckoutException

    def initialize(message)
      super
    end

    def self.invalid_authorization(authorization_type)
      CheckoutAuthorizationException.new("Operation requires #{authorization_type} authorization type")
    end

    def self.invalid_key(key_type)
      CheckoutAuthorizationException.new("#{key_type} is required for this operation.")
    end
  end

  class CheckoutApiException < CheckoutException
    attr_reader :http_metadata, :error_details

    def initialize(response)
      @http_metadata = CheckoutUtils.map_to_http_metadata(response)
      if !http_metadata.body.nil?
        @error_details = JSON.parse(http_metadata.body, object_class: OpenStruct)
      end
      super("The API response status code (#{http_metadata.status_code}) does not indicate success.")
    end

  end

end
