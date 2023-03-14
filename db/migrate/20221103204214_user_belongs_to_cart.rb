class UserBelongsToCart < ActiveRecord::Migration[6.1]
  def change
    add_reference :carts, :user, null: true, foreign_key: true
    add_column :carts, :product_info, :string
    add_column :carts, :total, :float, default: 0.0
    add_column :carts, :session_id, :string
  end
end
