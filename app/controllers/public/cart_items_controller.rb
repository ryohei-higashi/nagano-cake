class Public::CartItemsController < ApplicationController

before_action :authenticate_customer!

  def index
   @cart_items = CartItem.all
   @total = 0
  end

  def update
   cart_item = CartItem.find(params[:id])
   cart_item.update(cart_item_params)
   redirect_to cart_items_path
  end

  def create
    cart_items = current_customer.cart_items
    same_cart_item = cart_items.find_by(item_id: params[:cart_item][:item_id])
   if same_cart_item != nil
     same_cart_item.amount += params[:cart_item][:amount].to_i
     same_cart_item.update(amount: same_cart_item.amount)
   else
     cart_item = CartItem.new(cart_item_params)
     cart_item.customer_id = current_customer.id
     cart_item.save
   end
   
   redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_item = CartItem.all
    cart_item.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
