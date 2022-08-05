# frozen_string_literal: true

require_relative "checkout_sdk/version"

module CheckoutSdk
  class << self
  end

  def self.builder
    DefaultSdk
  end

end
