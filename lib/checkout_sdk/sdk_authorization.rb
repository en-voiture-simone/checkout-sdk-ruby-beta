module CheckoutSdk
  class SdkAuthorization
    attr_accessor :platform_type, :credential

    def initialize(platform_type, credential)
      @platform_type = platform_type
      @credential = credential
    end

    def get_authorization_header
      case @platform_type
      when PlatformType::PREVIOUS, PlatformType::CUSTOM
        @credential
      when PlatformType::DEFAULT, PlatformType::OAUTH
        "Bearer " + @credential
      else
        raise CheckoutAuthorizationException.new "Invalid platform type"
      end
    end
  end
end