class ProductCategoriesController < ApplicationController
    def index
    end

    def show
        @category = ProductCategory.find(params[:id])
        @products = @category.products

        AuditLogEntry.event(
            event: "asdfsdf",
            actor_id: 1,
            target: "admin",
            ip_address: "127.0.0.1"
        )
    end
end
