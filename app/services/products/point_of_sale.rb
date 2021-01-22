# frozen_string_literal: true

module Products
  class PointOfSale #:nodoc:
    def initialize
      @products = []
    end

    def scan_barcode(barcode)
      scanned_product = scanner.call(barcode)
      Products::Display.display_product(scanned_product)
      products << scanned_product if scanned_product
    end

    def press_exit
      Products::Printer.call(products)
      Products::Display.display_sum(products)
    end

    private

    def scanner
      @scanner ||= Products::Scanner.new
    end

    attr_reader :products
  end
end
