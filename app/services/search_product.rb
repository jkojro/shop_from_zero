# frozen_string_literal: true

class SearchProduct
  def call(phrase)
    query = ApplicationRecord.sanitize_sql_array(['SELECT DISTINCT products.* FROM products WHERE products.name ILIKE ?', "%#{phrase}%"])
    Product.find_by_sql(query)
  end
end
