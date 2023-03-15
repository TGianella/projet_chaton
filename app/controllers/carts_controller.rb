class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = current_user.cart
    @cart.destroy
    @cart = Cart.new
    @cart.user = current_user
    @cart.save
    redirect_to cart_path(@cart)
  end
end
