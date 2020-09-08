class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.integer :quantity
      t.text :color
      t.text :size
      t.integer :price_cents
      t.integer :sale_price_cents
      t.integer :cost_cents
      t.string :sku
      t.integer :weight
      t.integer :length
      t.integer :width
      t.integer :height
      t.text :note

      t.timestamps
    end
  end
end
