# frozen_string_literal: true

FactoryBot.define do
  factory :cart_product do
    product
    cart
    counter { 3 }
  end
end
