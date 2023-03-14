class Cart < ApplicationRecord
    has_many :products

    def items_in_cart
        json = JSON.load(product_info)
    end
end