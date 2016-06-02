class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_no
      t.integer :order_id
      t.string :order_type

      t.timestamps
    end
  end
end
