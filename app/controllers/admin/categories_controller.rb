class Admin::CategoriesController < Admin::AdminController
    def index
        render json: ProductCategory.all
    end
end
