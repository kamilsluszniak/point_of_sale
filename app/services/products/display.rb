# frozen_string_literal: true

module Products
  class Display #:nodoc:
    class <<self
      # rubocop:disable Rails/Output
      def display_product(product)
        if product.is_a? Product
          puts "|||name: #{product.name}|||price: #{product.price}|||"
        else
          puts 'Product not found'
        end
      end

      def display_sum(products)
        puts "Total Sum: #{products.map(&:price).inject(:+)}"
      end
      # rubocop:enable Rails/Output
    end
  end
end
