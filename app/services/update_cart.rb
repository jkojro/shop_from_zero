class UpdateCart
  include Dry::Monads[:result]

  def initialize(cart)
    @cart = cart
  end

  def call(cart_params:)
    if cart_params[:products_add]
      add_product_items(cart_params)
    elsif cart_params[:products_attributes]
      update_cart(cart_params[:products_attributes].values)
    end
  end

  private

  def add_product_items(cart_params)
    product = find_product(cart_params[:product_id])
    cart_params[:products_add].to_i.times do
      LineItem.create(cart_id: @cart.id, product_id: product.id)
      CartProduct.where(cart_id: @cart.id, product_id: product.id).first_or_create
    end

    Success(:success)
  end

  def update_cart(products_attributes)
    products_attributes.each do |product_attributes|
      product = find_product(product_attributes[:id])
      items_count = product_attributes[:products_number].to_i
      difference = items_count - product.cart_products_count(@cart)

      if difference > 0
        difference.times { LineItem.create(cart_id: @cart.id, product_id: product.id) }
      elsif difference < 0
        @cart.line_items.where(product_id: product.id).limit(difference.abs).destroy_all
      end
    end

    Success(:success)
  end

  def find_product(product_id)
    product = Product.find_by(id: product_id)

    if product
      Success(product).value!
    else
      Failure(:product_not_found)
    end
  end
end
