class UpdateCart
  include Dry::Monads[:result]

  def initialize(cart)
    @cart = cart
  end

  def call(cart_params:)
    # if cart_params[:products_add]
    #   add_product_items(cart_params)
    # elsif cart_params[:products_attributes]
      update_cart(cart_params[:products_attributes].values)
    # end
  end

  private
  #
  # def add_product_items(cart_params)
  #   find_product(cart_params[:product_id]).bind do |product|
  #     items_number_to_add(cart_params[:products_add]).fmap do |items_number|
  #       item = CartProduct.where(cart_id: @cart.id, product_id: product.id).first_or_create
  #       new_counter = item.counter + items_number
  #       item.update(counter: item.counter + items_number)
  #     end
  #   end
  # end

  def update_cart(products_attributes)
    validate_items_number(products_attributes).bind do |products_attributes|
      products_attributes.each do |product_attributes|
        find_product(product_attributes[:id]).fmap do |product|
          items_count = product_attributes[:products_number].to_i
          difference = items_count - product.cart_products_count(@cart)

          item = CartProduct.where(cart_id: @cart.id, product_id: product.id).first
          new_counter = item.counter + difference
          item.update(counter: new_counter)
        end
      end
      Success('success')
    end
  end

  def validate_items_number(products_attributes)
    if products_attributes.all? { |attr| attr[:products_number].to_i <= 10 }
      Success(products_attributes)
    else
      Failure(:too_many_items)
    end
  end

  def items_number_to_add(number)
    number.to_i <= 5 ? Success(number.to_i) : Failure(:too_many_items)
  end

  def find_product(product_id)
    product = Product.find_by(id: product_id)

    if product
      Success(product)
    else
      Failure(:product_not_found)
    end
  end
end
