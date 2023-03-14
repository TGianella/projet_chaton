class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items
  has_many :items, through: :order_items

  validates :status, presence: true,
                     inclusion: { in: %w[current pending paid],
                                  message: '%<value>s is not a valid status' }
end
