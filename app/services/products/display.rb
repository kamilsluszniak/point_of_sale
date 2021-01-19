# frozen_string_literal: true

module Products
  class Display

    def initialize(product)
      @product = product
    end

    def call
      return 'Product not found' unless product

      return "|||name: #{product.name}|||price: #{product.price}|||"
    end

    private
    attr_reader :product
  end
end
