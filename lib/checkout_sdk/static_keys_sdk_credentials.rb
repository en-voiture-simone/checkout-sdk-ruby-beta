module CheckoutSdk
  class StaticKeysSdkCredentials < SdkCredentials
    attr_accessor :secret_key, :public_key

    def initialize(secret_key, public_key)
      @secret_key = secret_key
      @public_key = public_key
    end

    def get_authorization(authorization_type)

      case authorization_type
      when AuthorizationType::SECRET_KEY, AuthorizationType::SECRET_KEY_OR_OAUTH
        if secret_key.nil?
          raise CheckoutAuthorizationException.invalid_key AuthorizationType::SECRET_KEY
        end
        SdkAuthorization.new(PlatformType::DEFAULT, @secret_key)
      when AuthorizationType::PUBLIC_KEY, AuthorizationType::PUBLIC_KEY_OR_OAUTH
        if public_key.nil?
          raise CheckoutAuthorizationException.invalid_key AuthorizationType::PUBLIC_KEY
        end
        SdkAuthorization.new(PlatformType::DEFAULT, @public_key)
      else
        raise CheckoutAuthorizationException.invalid_authorization authorization_type
      end

    end

  end
end
