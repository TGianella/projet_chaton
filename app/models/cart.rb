class Cart < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  belongs_to :user

  def import_order(order)
    order.order_items.each do |order_item|
      OrderItem.create!(cart: self, item: order_item.item, quantity: order_item.quantity)
    end
  end

  def self.empty_for(user)
    user.cart.destroy
    cart = Cart.new(user: user)
    cart.save
  end
end
