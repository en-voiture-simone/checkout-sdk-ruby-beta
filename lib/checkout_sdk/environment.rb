module CheckoutSdk
  class Environment
    attr_reader :base_uri,
                :authorization_uri,
                :files_uri,
                :transfers_uri,
                :balances_uri,
                :is_sandbox

    def initialize(base_uri, authorization_uri, files_uri, transfers_uri, balances_uri, is_sandbox)
      @base_uri = base_uri
      @authorization_uri = authorization_uri
      @files_uri = files_uri
      @transfers_uri = transfers_uri
      @balances_uri = balances_uri
      @is_sandbox = is_sandbox
    end

    def self.sandbox
      env = Environment.new('https://api.sandbox.checkout.com/',
                            'https://access.sandbox.checkout.com/connect/token',
                            'https://files.sandbox.checkout.com/',
                            'https://transfers.sandbox.checkout.com/',
                            'https://balances.sandbox.checkout.com/',
                            true)
      env
    end

    def self.production
      env = Environment.new('https://api.checkout.com/',
                            'https://access.checkout.com/connect/token',
                            'https://files.checkout.com/',
                            'https://transfers.checkout.com/',
                            'https://balances.checkout.com/',
                            false)
      env
    end

  end
end
