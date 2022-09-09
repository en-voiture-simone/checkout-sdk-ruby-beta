# frozen_string_literal: true

module Helpers
  module SandboxTestFixture
    # @return [CheckoutSdk::DefaultSdk::CheckoutApi]
    def default_sdk
      CheckoutSdk.builder
                 .static_keys
                 .with_secret_key(ENV['CHECKOUT_DEFAULT_SECRET_KEY'])
                 .with_public_key(ENV['CHECKOUT_DEFAULT_PUBLIC_KEY'])
                 .with_environment(CheckoutSdk::Environment.sandbox)
                 .build
    end

    def retriable(callback, predicate = nil)
      current_attempt = 1
      max_attempts = 10
      while current_attempt <= max_attempts
        begin
          response = callback.call
          return response if predicate.nil?
          return response if predicate.call(response)
        rescue CheckoutSdk::CheckoutApiException => e
          sleep 2
        end
        current_attempt += 1
      end
    end

    def assert_response(response, properties = nil)
      expect(response).not_to be nil
      unless properties.nil?
        properties.each do |evaluation|
          assert_response_validation(response, evaluation)
        end
      end
    end

    def new_idempotency_key
      "ik-#{SecureRandom.uuid}"
    end

    private

    def assert_response_validation(response, properties)
      if properties.include? '.'
        # "a.b.c" to "a","b","c"
        props = properties.split('.')
        # value['a']
        nested_object = response[props[0].to_sym]
        # collect to 'b.c'
        joined = props.drop(1).join('.')
        assert_response_validation(nested_object, joined)
      else
        expect(response[properties.to_sym]).not_to be nil
      end
    end
  end
end
