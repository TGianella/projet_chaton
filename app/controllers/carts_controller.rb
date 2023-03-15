class CartsController < ApplicationController
  before_action :authenticate_user!, :my_cart?

  def show
    @cart = Cart.find(params[:id])
    @item_quantity = item_quantity
    @item_quantity_price = item_quantity_price

  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    @cart = Cart.new
    @cart.user = current_user
    @cart.save
    redirect_to cart_path(@cart)
  end


  private

  def my_cart?
    return if current_user.cart == Cart.find(params[:id])

    redirect_back fallback_location: root_path
  end

  def item_quantity
    @amount = 0
    @cart.order_items.each do |order_item|
      @amount += order_item.quantity
    end
    @amount
  end

  def item_quantity_price
    @total = 0
    @cart.order_items.each do |order_item|
      @total += order_item.item.price * order_item.quantity
    end
    '%.02f' % @total
  end


end
