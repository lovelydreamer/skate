class ReportsController < ApplicationController
    before_filter :require_valid_table, only: [index]
    VALID_TABLES = %w(analytics, reports)

    def index
        query = "SELECT createdAt FROM #{params[:table]} WHERE country='DE'"
        results = ActiveRecord::Base.connection.execute(sql)
    end

    private
    def require_valid_table
        raise "InvalidTable" unless VALID_TABLES.include?(params[:table])
    end


    def show

    end

    def new
    end

    # INSECURE: Potential Mass assignment
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
