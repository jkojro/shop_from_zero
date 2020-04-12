# frozen_string_literal: true

class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    redirect_back(fallback_location: products_path) if params[:q].empty?
    @searched_products = ::ProductsSearcher.new(params[:q]).perform
    if @searched_products.empty?
      flash[:notice] = 'Nie ma takiego produktu'
      redirect_back(fallback_location: products_path) unless @searched_products.any?
    end
  end
end
