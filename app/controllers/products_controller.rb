# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_cart, only: :show

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.find_by(product_id: @product.id, cart_id: @cart.id)
  end

  def search
    redirect_back(fallback_location: products_path) if params[:q].empty?
    @products = ::ProductsSearcher.new(params[:q]).perform
    if @products.empty?
      flash[:notice] = 'Nie ma takiego produktu'
      redirect_back(fallback_location: products_path) unless @products.any?
    end
  end

  private

  def set_cart
    @cart ||=  begin
      if session[:cart_id]
        Cart.find(session[:cart_id])
      else
        cart = Cart.create
        session[:cart_id] = cart.id
      end
    end
  end
end
