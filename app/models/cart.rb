class Cart < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  belongs_to :user

  def total_price
    sum = 0
    order_items.each { |order_item| sum += order_item.total_price }
    sum
  end

  def total_quantity
    sum = 0
    order_items.each { |order_item| sum += order_item.quantity }
    sum
  end
end
