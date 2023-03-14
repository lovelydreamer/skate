# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :product_id
      t.timestamps
    end

    add_index :reviews, :product_id
  end
end
