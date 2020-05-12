# frozen_string_literal: true

module Validators
  class CartProductValidator < Dry::Validation::Contract
    params do
      required(:cart_id).value(:integer)
      required(:product_id).value(:integer)
      required(:number_to_add).value(:integer)
    end

    rule(:number_to_add) do
      if values[:number_to_add] > 5
        key.failure('Dodałeś zbyt wiele sztuk produktu')
      end
    end
  end
end
