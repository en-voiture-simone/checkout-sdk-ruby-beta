require 'checkout_sdk/common/address'
require 'checkout_sdk/common/country'
require 'checkout_sdk/common/phone'

module Helpers
  module DataFactory

    CARD_NUMBER = '4242424242424242'
    EXPIRY_MONTH = 6
    EXPIRY_YEAR = 2025
    NAME = 'Test Name'

    attr_reader :address,
                :phone

    def phone
      if @phone == nil
        phone = CheckoutSdk::Common::Phone.new
        phone.country_code = '1'
        phone.number = '4155552671'

        @phone = phone
      end
      @phone
    end

    def address
      if @address == nil
        address = CheckoutSdk::Common::Address.new
        address.address_line1 = "CheckoutSdk.com"
        address.address_line2 = "90 Tottenham Court Road"
        address.city = "London"
        address.state = "London"
        address.zip = "W1T 4TJ"
        address.country = CheckoutSdk::Common::Country::GB

        @address = address
      end
      @address
    end

    def generate_random_email
      "#{rand 99999999}@checkout-sdk-ruby.com"
    end
  end
end