class Admin::OrdersController < ApplicationController
before_action :authenticate_admin!
 def edit
  @order = Order.find(params[:id])
  @order_details = @order.order_details.all
  @subtotal = 0
  @total = 0
 end

 def update
  order = Order.find(params[:id])
  order.update(order_params)
  if order.status_before_type_cast == 1
   # @order_details = order.order_details
   # @order_details.each do |order_detail|
    # order_detail.production_status.key(1)
    order.order_details.update_all(production_status: 1)
  end
  # 1.「もし注文ステータスが「入金確認」になったら、」というif文を作成
  # 2. 注文データ(order)に紐づく注文詳細データをすべて取得、変数に格納
  # (ex. ユーザーに紐づく本一覧は user.books)
  # 3. 先ほど取得した注文詳細データを一つ一つ取り出し、製作ステータスを更新

  redirect_to edit_admin_order_path(order.id)
 end

 private
  def order_params
    params.require(:order).permit(:status)
  end

end
