class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def add_item
    new_customer_item = CustomerItem.new(customer_id: params[:id], item_id: params[:item_id])
    if new_customer_item.save
      redirect_to "/customers/#{params[:id]}"      
    else
      flash[:notice] = "this is not a valid item."
      redirect_to "/customers/#{params[:id]}"
    end
  end
end