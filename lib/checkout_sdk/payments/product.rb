module CheckoutSdk
  module Payments
    class Product
      # @!attribute name
      #   @return [String]
      # @!attribute quantity
      #   @return [Integer]
      # @!attribute unit_price
      #   @return [Integer]
      # @!attribute reference
      #   @return [String]
      # @!attribute commodity_code
      #   @return [String]
      # @!attribute unit_of_measure
      #   @return [String]
      # @!attribute total_amount
      #   @return [Integer]
      # @!attribute tax_amount
      #   @return [Integer]
      # @!attribute discount_amount
      #   @return [Integer]
      # @!attribute wxpay_goods_id
      #   @return [String]
      # @!attribute image_url
      #   @return [String]
      # @!attribute url
      #   @return [String]
      # @!attribute sku
      #   @return [String]
      attr_accessor :name,
                    :quantity,
                    :unit_price,
                    :reference,
                    :commodity_code,
                    :unit_of_measure,
                    :total_amount,
                    :tax_amount,
                    :discount_amount,
                    :wxpay_goods_id,
                    :image_url,
                    :url,
                    :sku

    end
  end
end