class ReviewsController < ApplicationController
    def index
    end

    def show
    end

    def new
    end

    def create
        product = Product.find(params[:review][:product])

        review = Review.create(
            content: params[:review][:content],
            product: product,
            user: current_user || User.first
        )

        redirect_to product
    end

    def edit
    end
    
    def update
    end

    def destroy
    end
end
