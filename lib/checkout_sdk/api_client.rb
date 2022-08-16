module CheckoutSdk
  class ApiClient

    def initialize(configuration, base_uri)
      # TODO expect given http client
      @client = built_default_client(base_uri)
    end

    def invoke_get(path,
                   authorization,
                   params = nil)
      invoke(:get, path, authorization)
    end

    def invoke_post(path,
                    authorization,
                    request = nil,
                    idempotency_key = nil)
      invoke(:post, path, authorization, request, idempotency_key)
    end

    def invoke_put(path,
                   authorization,
                   request)
      invoke(:put, path, authorization, request)
    end

    def invoke_patch(path,
                     authorization,
                     request = nil)
      invoke(:patch, path, authorization, request)
    end

    def invoke_delete(path,
                      authorization)
      invoke(:delete, path, authorization)
    end

    private def invoke(method, path, authorization, body = nil, idempotency_key = nil)

      headers = {
        'User-Agent': 'checkout-sdk-ruby/' + VERSION,
        'Accept': 'application/json',
        'Authorization': authorization.get_authorization_header,
        'Content-Type': 'application/json' }

      if !idempotency_key.nil?
        headers[':Cko - Idempotency - Key'] = idempotency_key
      end

      hash = CheckoutSdk::JsonSerializer.to_custom_hash(body)

      begin
        response = @client.run_request(method, path, hash.to_json, headers)
      rescue Faraday::ClientError => e
        raise CheckoutApiException.new e.response
      end

      # TODO include http metadata response
      if !response.body.nil? && response.body != ''
        JSON.parse(response.body, object_class: OpenStruct)
      end
    end

    private def built_default_client(base_uri)
      Faraday.new(base_uri) do |f|
        f.response(:raise_error)
      end
    end

  end
end