class OrderItemsController < ApplicationController
  def create
    puts '$' * 60
    puts "Item_id = #{params[:item_id]}"
    puts params
    item = Item.find(params[:item_id])
    current_cart = current_user.cart

    if current_cart.items.include?(item)
      @order_item = current_cart.order_items.find_by(item_id: item)
      @order_item.quantity += 1
    else
      @order_item = OrderItem.new
      @order_item.cart = current_cart
      @order_item.item = item
    end

    @order_item.save
    flash[:success] = 'Image ajoutée au panier'
    puts '$' * 60
    puts current_cart.order_items.last
  end

  def add_quantity; end

  def reduce_quantity; end

  def destroy; end
end
