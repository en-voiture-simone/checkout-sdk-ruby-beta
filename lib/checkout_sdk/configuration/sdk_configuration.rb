class SdkConfiguration
  attr_accessor :credentials
  attr_accessor :environment
  # http_client

  def initialize(credentials, environment)
    @credentials = credentials
    @environment = environment
  end
end
