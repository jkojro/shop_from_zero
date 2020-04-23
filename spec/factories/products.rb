# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    description { 'Product description' }
    price { '3.33' }
  end
end
