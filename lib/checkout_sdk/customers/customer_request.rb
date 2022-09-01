module CheckoutSdk
  module DefaultSdk
    module Customers
      class CustomerRequest
        attr_accessor :email,
                      :name,
                      :phone, #common.Phone
                      :metadata,
                      :default,
                      :instruments
      end
    end
  end
end
