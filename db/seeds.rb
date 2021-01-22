# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(0..9).each do |_num|
  Product.create(
    name: Faker::Food.vegetables,
    price: rand(10.0...20.0),
    code: Faker::Barcode.ean(13)
  )
end
