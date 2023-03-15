class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :cart, optional: true
  belongs_to :item

  # validates :item_id, uniqueness: { scope: :order_id, message: "ne peut être qu'une seule fois dans une commande" }
  validates :quantity, numericality: { in: 1..99 }
end
