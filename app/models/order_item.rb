class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :item_id, uniqueness: { scope: :order_id, message: "ne peut être qu'une seule fois dans une commande" }
end
