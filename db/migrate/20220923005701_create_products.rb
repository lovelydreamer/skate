# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.float :cost
      t.integer :product_category_id
      t.timestamps
    end

    add_index :products, :product_category_id
  end
end
