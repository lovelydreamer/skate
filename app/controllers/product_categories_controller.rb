class ProductCategoriesController < ApplicationController
    def index
    end

    def show
        @category = ProductCategory.find(params[:id])
        @products = @category.products
    end
end
