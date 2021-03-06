# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = SearchProduct.new.call(params[:q])
    if @products.empty?
      flash[:notice] = 'Nie ma takiego produktu'
      redirect_back(fallback_location: products_path) unless @products.any?
    end
  end
end
