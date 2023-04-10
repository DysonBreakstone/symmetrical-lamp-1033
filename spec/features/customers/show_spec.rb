require 'rails_helper'

RSpec.describe 'Customer Show page', type: :feature do
  describe "show page" do
    before do
      @market1 = Supermarket.create(name:"market1", location: "location1")
      @market2 = Supermarket.create(name:"market2", location: "location2")
      @market3 = Supermarket.create(name:"market3", location: "location3")
      @customer1 = Customer.create(name: "customer1")
      @customer2 = Customer.create(name: "customer2")
      @customer3= Customer.create(name: "customer3")
      @item1 = @market1.items.create(name: "item1", price: 1)
      @item2 = @market1.items.create(name: "item2", price: 2)
      @item3 = @market1.items.create(name: "item3", price: 3)
      CustomerItem.create(customer_id: @customer1.id, item_id: @item1.id)
      CustomerItem.create(customer_id: @customer2.id, item_id: @item1.id)
      CustomerItem.create(customer_id: @customer2.id, item_id: @item2.id)
      CustomerItem.create(customer_id: @customer3.id, item_id: @item2.id)
      CustomerItem.create(customer_id: @customer3.id, item_id: @item3.id)
    end

    it "shows customer name and list of items" do
      visit "/customers/#{@customer2.id}"

      expect(page).to have_content("customer2")
      expect(page).to have_content("item1")
      expect(page).to have_content("item2")
      expect(page).to have_content("item2")
      expect(page).to have_content("price: 1")
      expect(page).to have_content("price: 2")
      expect(page).to have_content("market: market1")
    end
  end

  describe "add item form" do
    before do
      @market1 = Supermarket.create(name:"market1", location: "location1")
      @market2 = Supermarket.create(name:"market2", location: "location2")
      @market3 = Supermarket.create(name:"market3", location: "location3")
      @customer1 = Customer.create(name: "customer1")
      @customer2 = Customer.create(name: "customer2")
      @customer3= Customer.create(name: "customer3")
      @item1 = @market1.items.create(name: "item1", price: 1)
      @item2 = @market1.items.create(name: "item2", price: 2)
      @item3 = @market1.items.create(name: "item3", price: 3)
      CustomerItem.create(customer_id: @customer1.id, item_id: @item1.id)
      CustomerItem.create(customer_id: @customer2.id, item_id: @item1.id)
      CustomerItem.create(customer_id: @customer2.id, item_id: @item2.id)
      CustomerItem.create(customer_id: @customer3.id, item_id: @item2.id)
      CustomerItem.create(customer_id: @customer3.id, item_id: @item3.id)
    end

    it "has add items form" do
      visit "/customers/#{@customer3.id}"

      expect(page).to have_content("Add item")
      expect(page).to have_field("item_id")
      expect(page).to have_button("Add this item")
    end

    it "button adds item to customer show page" do
      visit "/customers/#{@customer3.id}"

      expect(page).to have_no_content("item1")
      save_and_open_page
      fill_in("item_id", with: @item1.id)
      click_button("Add this item")
      save_and_open_page
      expect(page).to have_content("item1")
    end
  end
end