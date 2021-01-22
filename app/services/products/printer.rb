# frozen_string_literal: true

module Products
  class Printer #:nodoc:
    class <<self
      # rubocop:disable Rails/Output
      def call(products)
        puts 'Scanned products:'
        products.each do |product|
          puts("#{product.name}, price: #{product.price}")
        end
        puts "Total Sum: #{products.map(&:price).inject(:+)}"
      end
      # rubocop:enable Rails/Output
    end
  end
end
