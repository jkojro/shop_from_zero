# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_cart, only: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    @cart = Cart.find(session[:cart_id])
    @product = Product.find(params[:id])
    @cart_product = CartProduct.where(product_id: @product.id, cart_id: @cart.id).first_or_initialize
  end

  def search
    @products = SearchProduct.new.call(params[:q])
    if @products.empty?
      flash[:notice] = 'Nie ma takiego produktu'
      redirect_back(fallback_location: products_path) unless @products.any?
    end
  end

  private

  def set_cart
    @cart ||= begin
      if user_signed_in?
        if user_session[:cart_id]
          Cart.find(session[:cart_id])
        else
          cart = Cart.create
          user_session[:cart_id] = cart.id
          cart
        end
      else
        if session[:cart_id]
          Cart.find(session[:cart_id])
        else
          cart = Cart.create
          session[:cart_id] = cart.id
          cart
        end
      end
    end
  end
end
