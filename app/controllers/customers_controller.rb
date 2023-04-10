class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def add_item
    new_customer_item = CustomerItem.create(customer_id: params[:id], item_id: params[:item_id])
    redirect_to "/customers/#{params[:id]}"
  end
end