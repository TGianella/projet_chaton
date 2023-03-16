class Order < ApplicationRecord
  after_create :send_order_email, :order_recap_to_admin_email
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  validates :status, presence: true,
                     inclusion: { in: %w[pending paid],
                                  message: '%<value>s is not a valid status' }

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

  def send_order_email
    UserMailer.send_order(self).deliver_later
  end

  def order_recap_to_admin_email
    UserMailer.order_recap_to_admin(self).deliver_later
  end
end
