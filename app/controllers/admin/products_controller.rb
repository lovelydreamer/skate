# frozen_string_literal: true

# INSECURE: This should be inheriting from the admin controller
module Admin
  class ProductsController < ApplicationController
    def index
      render json: Product.all
    end
  end
end
