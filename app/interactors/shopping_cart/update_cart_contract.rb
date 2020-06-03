# frozen_string_literal: true

class ShoppingCart
  class UpdateCartContract < Dry::Validation::Contract
    params do
      required(:items).filled(:hash)
    end

    rule(:items) do
      if value.select { |_k, v| v.to_i > 5 }.any?
        key.failure('Invalid quantity')
      end
    end
  end
end
