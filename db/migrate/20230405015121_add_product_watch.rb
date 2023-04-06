class AddProductWatch < ActiveRecord::Migration[6.1]
  def change
    create_table :product_subscriptions do |t|
      t.text :url
      t.text :user_agent
      t.integer :product_id
      t.integer :user_id
      t.timestamps
    end
  end
end
