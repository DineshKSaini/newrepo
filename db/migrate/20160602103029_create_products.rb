class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :producttype

      t.timestamps
    end
  end
end
