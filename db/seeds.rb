# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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