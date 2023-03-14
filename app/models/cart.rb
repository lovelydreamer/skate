# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :products

  def items_in_cart
    json = JSON.parse(product_info)
  end
end
