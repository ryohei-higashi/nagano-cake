class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :production_status, null: false, default: 0
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
