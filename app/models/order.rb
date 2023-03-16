class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  validates :status, presence: true,
                     inclusion: { in: %w[pending paid],
                                  message: '%<value>s is not a valid status' }

  def validate_payment
    self.status = 'paid'
    save
  end

  def import_cart(cart)
    cart.order_items.each do |order_item|
      OrderItem.create!(order: self, item: order_item.item, quantity: order_item.quantity)
    end
  end

  def self.create_for(_user)
    order = Order.new(user: _user, status: 'pending')
    order.save
    order
  end
end
