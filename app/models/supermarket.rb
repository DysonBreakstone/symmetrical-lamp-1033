class Supermarket < ApplicationRecord
  has_many :items
  has_many :customers, through: :items

  def all_customers
    self.customers.pluck(:name).join(', ')
  end
end