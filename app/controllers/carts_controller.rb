class CartsController < ApplicationController
  before_action :set_cart

  def update
    unless UpdateCart.new(@cart).(cart_params: cart_params).success?
      flash["alert"] = "Coś poszło nie tak. Nie udało się zaktualizować koszyka."
    end

    redirect_to @cart
  end

  def show
  end

  def destroy
    @cart.products.destroy_all

    redirect_back(fallback_location: @cart)
  end

  private

  def set_cart
    @cart ||= Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:product_id, :products_add, products_attributes: [:id, :products_number])
  end
end
