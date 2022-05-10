class Public::CustomersController < ApplicationController

  def show
   @customer = current_customer.find(params[:id])
  end
  
end
