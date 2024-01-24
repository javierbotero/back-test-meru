FactoryBot.define do
  sequence(:name) { |n| "#{Faker::Commerce.product_name} #{n}" }
  factory :product do
    name { generate(:name) }
    price { Faker::Commerce.price }
    description { Faker::Lorem.paragraph }
  end
end
