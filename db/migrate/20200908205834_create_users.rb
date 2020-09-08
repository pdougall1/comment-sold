class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_plain
      t.boolean :superadmin
      t.string :shop_name
      t.string :remember_token, limit: 100
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :card_brand
      t.string :card_last_four
      t.timestamp :trial_ends_at
      t.string :shop_domain
      t.boolean :is_enabled
      t.string :billing_plan
      t.timestamp :trial_starts_at

      t.timestamps
    end
  end
end
