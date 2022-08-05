class SdkAuthorization
  attr_accessor :platform_type
  attr_accessor :credential

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
      raise "invalid platform type" #TODO implement error
    end
  end
end
