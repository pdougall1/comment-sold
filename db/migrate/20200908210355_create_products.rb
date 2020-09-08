class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.text :style
      t.text :brand
      t.string :url
      t.string :product_type
      t.integer :shipping_price
      t.text :note
      t.integer :admin_id

      t.timestamps
    end
  end
end
