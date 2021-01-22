# frozen_string_literal: true

module Products
  class Scanner #:nodoc:
    def call(product_code)
      Product.find_by(code: product_code)
    end
  end
end
