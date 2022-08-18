# frozen_string_literal: true

# Commons
require 'json'
require 'faraday'
require 'faraday/net_http'


# Version
require "checkout_sdk/version"

#Configuration
require 'checkout_sdk/http_metadata.rb'
require 'checkout_sdk/checkout_utils.rb'
require 'checkout_sdk/error'
require 'checkout_sdk/platform_type'
require 'checkout_sdk/environment'
require 'checkout_sdk/sdk_credentials'
require 'checkout_sdk/sdk_authorization'
require 'checkout_sdk/static_keys_sdk_credentials'
require 'checkout_sdk/checkout_configuration'

require 'checkout_sdk/authorization_type'
require 'checkout_sdk/client'
require 'checkout_sdk/api_client'
require 'checkout_sdk/abstract_checkout_sdk_builder'
require 'checkout_sdk/static_keys_builder'
require 'checkout_sdk/checkout_static_keys_sdk_builder'
require 'checkout_sdk/previous/checkout_previous_static_keys'
require 'checkout_sdk/previous/checkout_previous_sdk_builder'
require 'checkout_sdk/checkout_sdk_builder'

module CheckoutSdk
  include PlatformType

  class << self
  end

  def self.builder
    CheckoutSdkBuilder.new
  end

end
