class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.text :street_address
      t.text :apartment
      t.text :city
      t.text :state
      t.string :country_code
      t.text :zip
      t.string :phone_number
      t.text :email
      t.string :name
      t.string :order_status
      t.text :payment_ref
      t.string :transaction_id
      t.integer :payment_amt_cents
      t.integer :ship_charged_cents
      t.integer :ship_cost_cents
      t.integer :subtotal_cents
      t.integer :total_cents
      t.text :shipper_name
      t.timestamp :payment_date 
      t.timestamp :shipped_date 
      t.text :tracking_number
      t.integer :tax_total_cents

      t.timestamps
    end
  end
end
