# frozen_string_literal: true

(1..15).each do |n|
  Product.create(name: Faker::FunnyName.unique.name,
                 description: Faker::Lorem.sentence(word_count: 33),
                 price: Faker::Commerce.price)
end
