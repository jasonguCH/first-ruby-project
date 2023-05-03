# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

10.times do
  Product.create(
    {
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price,
      description: Faker::Lorem.paragraph,
      brand: Faker::Commerce.brand
    }
  )
end

3.times do
  Store.create(
    {
      name: Faker::Company.name,
      location: Faker::Address.city,
      address: Faker::Address.street_address,
      description: Faker::Lorem.paragraph
    }
  )
end

Product.all.each do |product|
  Store.all.each do |store|
    Stock.create(
      {
        product_id: product.id,
        store_id: store.id,
        quantity: rand(0..100)
      }
    )
  end
end
