# frozen_string_literal: true

require 'spec_helper'

module Products
  RSpec.describe Display, type: :model do
    context 'when subject exists' do
      let(:subject) { described_class.new(product) }
      let(:response) { subject.call }
        
      context 'when product exists' do
        let(:product) { create(:product) }

        # LCD response example:
        # |||name: cucumber|||price: 2.50|||
        it 'returns LCD response' do
          expect(response).to match(
            /\|{3}name:\s{1}[\w\s]+\|{3}price:\s{1}\d+\.?\d+\|{3}/
          )
        end
      end

      context 'when product doesn`t exist' do
        let(:product) { nil }

        it 'returns error message' do
          expect(response).to eq('Product not found')
        end
      end
    end
  end
end
