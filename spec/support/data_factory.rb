module Helpers
  module DataFactory
    NAME = 'Integration Test'
    FIRST_NAME = 'Integration'
    LAST_NAME = 'Test'
    SUCCESS_URL = 'https://testing.checkout.com/sucess'
    FAILURE_URL = 'https://testing.checkout.com/failure'

    # @return [CheckoutSdk::Common::Phone]
    def phone
      if @phone.nil?
        phone = CheckoutSdk::Common::Phone.new
        phone.country_code = '1'
        phone.number = '4155552671'

        @phone = phone
      end
      @phone
    end

    # @return [CheckoutSdk::Common::Address]
    def address
      if @address.nil?
        address = CheckoutSdk::Common::Address.new
        address.address_line1 = 'CheckoutSdk.com'
        address.address_line2 = '90 Tottenham Court Road'
        address.city = 'London'
        address.state = 'London'
        address.zip = 'W1T 4TJ'
        address.country = CheckoutSdk::Common::Country::GB

        @address = address
      end
      @address
    end

    # @return [String]
    def generate_random_email
      "#{rand 99_999_999}@checkout-sdk-ruby.com"
    end

    # @return [VisaCard]
    def visa_card
      @visa_card = VisaCard.new if @visa_card.nil?
      @visa_card
    end

    # @return [CheckoutSdk::Common::CustomerRequest]
    def common_customer_request
      if @common_customer_request.nil?
        customer = CheckoutSdk::Common::CustomerRequest.new
        customer.email = generate_random_email
        customer.name = NAME
        @common_customer_request = customer
      end
    end

    class VisaCard
      attr_reader :card_number,
                  :expiry_month,
                  :expiry_year,
                  :cvv,
                  :name

      def initialize
        @card_number = '4242424242424242'
        @expiry_month = 6
        @expiry_year = 2025
        @cvv = '100'
        @name = 'Visa Card Name'
      end
    end
  end
end