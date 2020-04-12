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
    @products = ::ProductsSearcher.new(params[:q]).perform
    if @products.empty?
      flash[:notice] = 'Nie ma takiego produktu'
      redirect_back(fallback_location: products_path) unless @products.any?
    end
  end
end
