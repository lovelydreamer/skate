class Product < ApplicationRecord
    has_many :reviews
    
    belongs_to :product_category
end
