# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def shopping_cart
    @_shopping_cart ||= ShoppingCart.new(session)
  end

  helper_method :shopping_cart
end
