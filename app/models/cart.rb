class Cart < ApplicationRecord
  has_many :order_items, dependant: :destroy
  has_many :items, through: :order_items
  belongs_to :user
end
