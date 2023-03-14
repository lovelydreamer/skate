# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :reviews
  has_one_attached :thumbnail

  belongs_to :product_category
end
