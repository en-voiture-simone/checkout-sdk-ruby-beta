module CheckoutSdk
  class CheckoutSdkBuilder

    def static_keys
      CheckoutSdk::DefaultSdk::CheckoutStaticKeysSdkBuilder.new
    end

    def previous
      CheckoutSdk::PreviousSdk::CheckoutPreviousSdkBuilder.new
    end

  end
end
