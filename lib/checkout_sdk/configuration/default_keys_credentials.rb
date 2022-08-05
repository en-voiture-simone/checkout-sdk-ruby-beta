require 'checkout_sdk/configuration/sdk_credentials'

class DefaultKeysCredentials < SdkCredentials
  attr_accessor :secret_key
  attr_accessor :public_key

  def initialize(secret_key, public_key)
    @secret_key = secret_key
    @public_key = public_key
  end

  def get_authorization(authorization_type)

    case authorization_type
    when AuthorizationType::SECRET_KEY, AuthorizationType::SECRET_KEY_OR_OAUTH
      SdkAuthorization.new(PlatformType::DEFAULT, @secret_key)
    when AuthorizationType::PUBLIC_KEY, AuthorizationType::PUBLIC_KEY_OR_OAUTH
      SdkAuthorization.new(PlatformType::DEFAULT, @public_key)
    else
      raise "invalid auth" # TODO implement error
    end

  end

end
