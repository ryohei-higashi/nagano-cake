class Admin::OrdersController < ApplicationController
before_action :authenticate_admin!
 def edit
  @order = Order.find(params[:id])
  @order_details = @order.order_dateilid
 end

 def update
  order = Order.find(params[:id])
  order.update(order_params)
  redirect_to edit_admin_order_path(order.id)
 end

 private
  def order_params
    param.require(:oder).permit(:status)
  end

end