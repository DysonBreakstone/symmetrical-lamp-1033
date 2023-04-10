require 'rails_helper'

RSpec.describe CustomerItem, type: :model do
  describe 'relationships' do
    it { should belong_to(:item) }
    it { should belong_to(:customer) }
  end

  # describe 'validations' do
  #   @market1 = Supermarket.create(name:"market1", location: "location1")
  #   @customer3 = Customer.create(name: "customer3")
  #   @item1 = @market1.items.create(name: "item1", price: 1)
    
  #   it "won't isntantiate with nonexistant item" do
  #     customer_item1 = CustomerItem.new(customer_id: @customer3.id, item_id: 50000000)
  #     expect(customer_item1.save).to eq(false)
  #   end
  # end
end