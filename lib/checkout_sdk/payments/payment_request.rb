module CheckoutSdk
  module Payments
    # @!attribute source
    #   @return [PaymentRequestSource]
    # @!attribute amount
    #   @return [Integer]
    # @!attribute currency
    #   @return [String] {CheckoutSdk::Common::Currency}
    # @!attribute payment_type
    #   @return [String] {PaymentType}
    # @!attribute merchant_initiated
    #   @return [TrueClass, FalseClass]
    # @!attribute reference
    #   @return [String]
    # @!attribute description
    #   @return [String]
    # @!attribute authorization_type
    #   @return [String] {AuthorizationType}
    # @!attribute capture
    #   @return [TrueClass, FalseClass]
    # @!attribute capture_on
    #   @return [Time]
    # @!attribute customer
    #   @return [CheckoutSdk::Common::CustomerRequest]
    # @!attribute billing_descriptor
    #   @return [BillingDescriptor]
    # @!attribute shipping
    #   @return [ShippingDetails]
    # @!attribute three_ds
    #   @return [ThreeDSRequest]
    # @!attribute processing_channel_id
    #   @return [String]
    # @!attribute previous_payment_id
    #   @return [String]
    # @!attribute risk
    #   @return [RiskRequest]
    # @!attribute success_url
    #   @return [String]
    # @!attribute failure_url
    #   @return [String]
    # @!attribute payment_ip
    #   @return [String]
    # @!attribute sender
    #   @return [Sender]
    # @!attribute recipient
    #   @return [PaymentRecipient]
    # @!attribute amount_allocations
    #   @return [Array(CheckoutSdk::Common::AmountAllocations)]
    # @!attribute processing
    #   @return [ProcessingSettings]
    # @!attribute metadata
    #   @return [Hash{String => Object}]
    # @!attribute items
    #   @return [Array(Product)]
    class PaymentRequest
      attr_accessor :source,
                    :amount,
                    :currency,
                    :payment_type,
                    :merchant_initiated,
                    :reference,
                    :description,
                    :authorization_type,
                    :capture,
                    :capture_on,
                    :customer,
                    :billing_descriptor,
                    :shipping,
                    :three_ds,
                    :processing_channel_id,
                    :previous_payment_id,
                    :risk,
                    :success_url,
                    :failure_url,
                    :payment_ip,
                    :sender,
                    :recipient,
                    :amount_allocations,
                    :processing,
                    :metadata,
                    :items
    end
  end
end
