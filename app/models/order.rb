class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { a: 0, b: 1, c: 2, d: 3, e: 4 }

   def address_display_order
    '〒' + post_code + ' ' + address + ' ' + name
   end

end
