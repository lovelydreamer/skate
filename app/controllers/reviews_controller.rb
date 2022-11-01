class ReviewsController < ApplicationController
    before_filter :find_review, only: [:show, :edit, :update, :destroy]

    def index
        @reviews = Review.all
    end

    def show
    end

    def new
    end

    # INSECURE: Potential IDOR?
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
    
    # Insecure: Mass Assignment?
    def update
        @review.update!(review_updata_params)
    end

    def destroy
        @review.destroy!
    end

    private
    def review_updata_params
        params.permit!
    end

    def find_review
        @review = Review.find(params[:id])
    end
end
