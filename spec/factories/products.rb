# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Food.vegetables }
    price { 10 }
    code { Faker::Barcode.ean(13) }
  end
end
