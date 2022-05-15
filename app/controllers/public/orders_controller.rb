class Public::OrdersController < ApplicationController

 def index
  @orders = current_customer.orders.all
 end

  def new
   @order = Order.new
  end

  def show
   @order = current_customer.orders.find(params[:id])
   @order_details = @order.order_details.all
   @total = 0
   @subtotal = 0
  end

  def create
   cart_items = current_customer.cart_items.all
   @order = current_customer.orders.new(order_params)
   @order.save
   cart_items.each do |cart_item|
    order_detail = OrderDetail.new
    order_detail.item_id = cart_item.item_id
    order_detail.order_id = @order.id
    order_detail.quantity = cart_item.amount
    order_detail.price = cart_item.item.price
    order_detail.save
   end
   cart_items.destroy_all

   redirect_to thanks_path


  end

  def confirmation

   @order = Order.new(order_params)
   @cart_items = current_customer.cart_items.all
   @order.shipping_cost = 800
   @total = 0
   @total_price = 0
   if params[:order][:select_address] == "0"
    @order.name = current_customer.full_name
    @order.address = current_customer.address
    @order.post_code = current_customer.postal_code

   elsif params[:order][:select_address] == "1"

     @address = Address.find(params[:order][:address_id])
     @order.name = @address.name
     @order.address = @address.address
     @order.post_code = @address.postal_code

   elsif params[:order][:select_address] == "2"
    @order.address = params[:order][:address]
    @order.post_code = params[:order][:post_code]
    @order.name = params[:order][:name]

   else
    redirect_to new_order_path
   end

  end
end

private

def order_params
 params.require(:order).permit(:customer_id, :address, :name, :post_code, :total_payment, :payment_method, :shipping_cost, :status,)
end