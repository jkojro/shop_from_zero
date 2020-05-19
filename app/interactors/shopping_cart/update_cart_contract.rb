class ShoppingCart
  class UpdateCartContract < Dry::Validation::Contract
    params do
      required(:items).filled(:hash)
    end

    rule(:items) do
      key.failure('Invalid quantity') if value.select { |k,v| v.to_i > 5 }.any?
    end
  end
end
