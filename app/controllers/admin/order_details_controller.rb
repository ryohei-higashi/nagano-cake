class Admin::OrderDetailsController < ApplicationController
before_action :authenticate_admin!

  def update
   order_detail = OrderDetail.find(params[:id])
   order_detail.update(order_detail_params)
   order = order_detail.order
   order_details = order.order_details
   if order_detail.production_status_before_type_cast == 2
    order_detail.order.update(status: 2)
   elsif order_details.all? {|order_detail| order_detail.d?}
    order.update(status: 3)
   end
   # 1.「もし製作ステータスが「製作中」だったら」というif文を作成
   # 2. 注文詳細に紐づく、注文データを取得、変数に格納
   # ex. 本に紐づく、ユーザーを取得 book.user
   # 3. 注文データの注文ステータスを「製作待ち」に更新

   # 1.
   redirect_to edit_admin_order_path(order_detail.order.id)
  end

  private
   def order_detail_params
     params.require(:order_detail).permit(:production_status)
   end

end
