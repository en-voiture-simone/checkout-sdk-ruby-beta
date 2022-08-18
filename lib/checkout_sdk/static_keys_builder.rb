module CheckoutSdk
  class StaticKeysBuilder < AbstractCheckoutSdkBuilder
    attr_accessor :secret_key
    attr_accessor :public_key

    def with_secret_key(secret_key)
      @secret_key = secret_key
      self
    end

    def with_public_key(public_key)
      @public_key = public_key
      self
    end

    protected def validate_secret_key(pattern)
      if secret_key.nil? || !secret_key.match(pattern)
        raise CheckoutArgumentException.new 'Invalid secret key'
      end
    end

    protected def validate_public_key(pattern)
      if !public_key.nil? && !public_key.match(pattern)
        raise CheckoutArgumentException.new('Invalid public key')
      end
    end

    protected def build
      super
      validate_secret_key(@secret_key_pattern)
      validate_public_key(@public_key_pattern)
    end

  end

end