class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
  end
  def create
    @cart = current_user.cart
    @order = Order.new(user: current_user, status: "pending")
    @order.save
    @cart.order_items.each do |order_item|
      OrderItem.create!(order: @order, item: order_item.item, quantity: order_item.quantity)
    end
  end

  def show
    @order = Order.find_by(user: current_user)
  end
end
