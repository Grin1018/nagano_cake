class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
