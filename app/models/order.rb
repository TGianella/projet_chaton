class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  validates :status, presence: true,
                     inclusion: { in: %w[pending paid],
                                  message: '%<value>s is not a valid status' }

  def validate_payment
    self.status = "paid"
    self.save
  end
end
