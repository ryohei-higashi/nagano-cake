class Public::CustomersController < ApplicationController

  def show
   @customer = current_customer.find(params[:id])
  end

  def edit
   @customer = current_customer.find(params[:id])
  end

  def update
   customer = current_customer.find(params[:id])
   customer.update(customer_params)
   redirect_to customers_path
  end

  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end
end
