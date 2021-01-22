# frozen_string_literal: true

require 'spec_helper'

module Products
  RSpec.describe PointOfSale, type: :model do
    context 'when subject exists' do
      subject(:point_of_sale_instance) { described_class.new }

      describe '#scan_barcode' do
        before do
          allow(Products::Scanner).to receive(:new).and_return(scanner_instance)
        end

        context 'when product is found' do
          before do
            allow(scanner_instance).to receive(:call).with(barcode).and_return(product)
            allow(Products::Display).to receive(:display_product).with(product).and_call_original
          end

          let(:response) { point_of_sale_instance.scan_barcode(barcode) }
          let(:scanner_instance) { instance_double(Products::Scanner) }
          let(:product) { create(:product) }
          let(:barcode) { product.code }

          it 'passes barcode to scanner instance and invokes display_product' do
            expect(Products::Scanner).to receive(:new)
            expect(scanner_instance).to receive(:call).with(barcode)
            expect(Products::Display).to receive(:display_product).with(product).and_call_original
            expect(response).to eq([product])
          end
        end

        context 'when product is not found' do
          before do
            allow(scanner_instance).to receive(:call).with(barcode).and_return(nil)
            allow(Products::Display).to receive(:display_product).with(nil).and_call_original
          end

          let(:response) { point_of_sale_instance.scan_barcode(barcode) }
          let(:scanner_instance) { instance_double(Products::Scanner) }
          let(:product) { create(:product) }
          let(:barcode) { Faker::Barcode.ean(13) }

          it 'doesn`t change scanned products array when not found' do
            expect(Products::Scanner).to receive(:new)
            expect(scanner_instance).to receive(:call).with(barcode)
            expect(Products::Display).to receive(:display_product).with(nil)
            expect(response).to eq(nil)
            expect(point_of_sale_instance.instance_variable_get(:@products)).to eql([])
          end
        end
      end

      describe '#press_exit' do
        before do
          allow(point_of_sale_instance).to receive(:products).twice.and_return(products)
        end

        context 'when products contain products array' do
          let(:response) { point_of_sale_instance.press_exit }
          let(:products) { create_list(:product, 3) }

          it 'passes products array to printer and display' do
            expect(point_of_sale_instance).to receive(:products).twice
            expect(Products::Printer).to receive(:call).with(products).and_call_original
            expect(Products::Display).to receive(:display_sum).with(products).and_call_original
            expect(response).to be_nil
          end
        end

        context 'when products array is empty' do
          let(:response) { point_of_sale_instance.press_exit }
          let(:products) { [] }

          it 'passes empty products array to printer and display' do
            expect(point_of_sale_instance).to receive(:products).twice
            expect(Products::Printer).to receive(:call).with(products).and_call_original
            expect(Products::Display).to receive(:display_sum).with(products).and_call_original
            expect(response).to be_nil
          end
        end
      end
    end
  end
end
