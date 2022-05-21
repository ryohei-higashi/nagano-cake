class Public::CustomersController < ApplicationController

before_action :authenticate_customer!

  def show
   @customer = current_customer
  end

  def edit
   @customer = current_customer
  end

  def update
   customer = current_customer
   customer.update(customer_params)
   redirect_to customers_path
  end

  def confirmation
  end

  def withdrawal
    # @customer = Customer.find(params[:id])←を入れるとCouldn't find customer without an IDとエラーが出てしまう
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active, :email)
  end
end
