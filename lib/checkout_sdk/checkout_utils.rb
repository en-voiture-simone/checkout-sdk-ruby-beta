module CheckoutSdk
  class CheckoutUtils

    def self.map_to_http_metadata(response)
      metadata = CheckoutSdk::HttpMetadata.new
      # TODO convert to hash
      metadata.headers = response[:headers]
      metadata.status_code = response[:status]
      metadata.body = response[:body]
      return metadata
    end

  end
end
