class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum production_status: { a: 0, b: 1, c: 2, d: 3 }

  def total_price
   sum("quantity*price")
  end

  def total_price2
   sum("total_price")
  end

end
