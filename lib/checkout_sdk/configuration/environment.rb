class Environment
  attr_reader :base_uri
  attr_reader :authorization_uri
  attr_reader :files_uri
  attr_reader :transfers_uri
  attr_reader :balances_uri
  attr_reader :is_sandbox

  def initialize(base_uri, authorization_uri, files_uri, transfers_uri, balances_uri, is_sandbox)
    @base_uri = base_uri
    @authorization_uri = authorization_uri
    @files_uri = files_uri
    @transfers_uri = transfers_uri
    @balances_uri = balances_uri
    @is_sandbox = is_sandbox
  end

  def self.sandbox
    env = Environment.new(base_uri='https://api.sandbox.checkout.com/',
                          authorization_uri='https://access.sandbox.checkout.com/connect/token',
                          files_uri='https://files.sandbox.checkout.com/',
                          transfers_uri='https://transfers.sandbox.checkout.com/',
                          balances_uri='https://balances.sandbox.checkout.com/',
                          is_sandbox=true)
    env
  end

  def self.production
    env = Environment.new(base_uri='https://api.checkout.com/',
                          authorization_uri='https://access.checkout.com/connect/token',
                          files_uri='https://files.checkout.com/',
                          transfers_uri='https://transfers.checkout.com/',
                          balances_uri='https://balances.checkout.com/',
                          is_sandbox=false)
    env
  end

end
