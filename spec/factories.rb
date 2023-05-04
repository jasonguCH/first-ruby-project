FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Number.decimal }
    description { Faker::Lorem.paragraph }
    brand { Faker::Commerce.material }
  end
end