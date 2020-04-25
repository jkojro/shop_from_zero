# frozen_string_literal: true

class SearchProduct
  def call(phrase)
    Product.search_by_name(phrase)
  end
end
