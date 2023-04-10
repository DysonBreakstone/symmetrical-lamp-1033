class Item < ApplicationRecord
  belongs_to :supermarket
  has_many :customer_items
  has_many :customers, through: :customer_items

  def how_many_purchases
    CustomerItem.where(item_id: self.id).size
  end
end