# frozen_string_literal: true

require 'spec_helper'

module Products
  RSpec.describe Printer, type: :model do
    context 'when subject exists' do
      subject(:printer_class) { described_class }

      context 'when products list is not empty' do
        let(:products) { create_list(:product, 3) }

        it 'outputs products response' do
          expect($stdout).to receive(:puts).with('Scanned products:')
          expect($stdout).to receive(:puts).with("#{products[0].name}, price: 10")
          expect($stdout).to receive(:puts).with("#{products[1].name}, price: 10")
          expect($stdout).to receive(:puts).with("#{products[2].name}, price: 10")
          expect($stdout).to receive(:puts).with('Total Sum: 30')
          expect(printer_class.call(products)).to be_nil
        end
      end

      context 'when products list is empty' do
        let(:products) { [] }

        it 'outputs empty products response' do
          expect($stdout).to receive(:puts).with('Scanned products:')
          expect($stdout).to receive(:puts).with('Total Sum: ')
          expect(printer_class.call(products)).to be_nil
        end
      end
    end
  end
end
