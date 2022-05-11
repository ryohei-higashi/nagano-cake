class Public::AddressesController < ApplicationController

  def index
   @addresses = current_customer.address.all
   @address = Address.new
  end

  def create
   @address = Address.new(address_params)
   @address.customer_id = current_customer.id
   @address.save
   redirect_to addresses_path
  end
  
end
