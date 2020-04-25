# frozen_string_literal: true

class UpdateCart
  include Dry::Monads[:result]

  def initialize(cart)
    @cart = cart
  end

  def call(cart_params:)
    products_attributes = cart_params[:products_attributes].values

    validate_items_number(products_attributes).bind do |products_attributes|
      products_attributes.each do |product_attributes|
        find_product(product_attributes[:id]).fmap do |product|
          items_count = product_attributes[:products_number].to_i
          difference = items_count - product.cart_products_count(@cart)

          item = CartProduct.where(cart_id: @cart.id, product_id: product.id).first
          new_counter = item.counter + difference

          update_item(item, new_counter)
        end
      end
      Success('success')
    end
  end

  private

  def validate_items_number(products_attributes)
    if products_attributes.all? { |attr| attr[:products_number].to_i <= 10 }
      Success(products_attributes)
    else
      Failure(:too_many_items)
    end
  end

  def find_product(product_id)
    product = Product.find_by(id: product_id)

    if product
      Success(product)
    else
      Failure(:product_not_found)
    end
  end

  def update_item(item, counter)
    if counter <= 0
      item.destroy
    else
      item.update(counter: counter)
    end
  end
end
