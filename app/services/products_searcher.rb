# frozen_string_literal: true

class ProductsSearcher

  def initialize(phrase)
    @phrase = phrase
  end

  def perform
    query = ApplicationRecord.send(:sanitize_sql_array, ["SELECT DISTINCT products.* FROM products WHERE products.name ILIKE ?", "%#{@phrase}%"])
    Product.find_by_sql(query)
  end
end
