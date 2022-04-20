class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :address, null: false
      t.string :name, null: false
      t.string :post_code, null: false
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :shipping_cost, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
