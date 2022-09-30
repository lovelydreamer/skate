class Admin::ProductsController < Admin::AdminController
    def index
        render json: Product.all
    end
end
