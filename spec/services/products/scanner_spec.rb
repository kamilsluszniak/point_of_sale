# frozen_string_literal: true

require 'spec_helper'

module Products
  RSpec.describe Scanner, type: :model do
    context 'when subject exists' do
      let(:subject) { described_class.new }
      let(:response) { subject.call(barcode) }

      context 'when product exists' do
        let(:product) { create(:product) }
        let(:barcode) { product.code }

        it 'returns LCD response' do
          expect(response).to eq(product)
        end
      end

      context 'when product doesn`t exist' do
        let(:barcode) { Faker::Barcode.ean(13) }

        it 'returns nil' do
          expect(response).to eq(nil)
        end
      end
    end
  end
end
