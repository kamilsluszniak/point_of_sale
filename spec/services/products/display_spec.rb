# frozen_string_literal: true

require 'spec_helper'

module Products
  RSpec.describe Display, type: :model do
    context 'when subject exists' do
      let(:subject) { described_class }

      describe '#display_product' do
        let(:response) { subject.display_product(product) }

        context 'when product exists' do
          let(:product) { create(:product) }

          # LCD response example:
          # |||name: cucumber|||price: 2.50|||
          it 'outputs LCD response' do
            expect { response }.to output(/\|{3}name:\s{1}[\w\s]+\|{3}price:\s{1}\d+\.?\d+\|{3}/)
              .to_stdout
          end
        end

        context 'when product doesn`t exist' do
          let(:product) { nil }

          it 'outputs error message' do
            expect { response }.to output(/Product not found/).to_stdout
          end
        end
      end

      describe '#display_sum' do
        let(:response) { subject.display_sum(products) }

        context 'when products exist' do
          let(:products) { create_list(:product, 3) }

          it 'outputs products price sum' do
            expect { response }.to output(/Total Sum: 30/).to_stdout
          end
        end
      end
    end
  end
end
