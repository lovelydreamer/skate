# INSECURE: This should be inheriting from the admin controller
class Admin::ProductsController < ApplicationController
    def index
        render json: Product.all
    end
end
