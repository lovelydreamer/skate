class SearchController < ApplicationController
    def index
        @keyword = params[:keyword]
        @products = Product.where("name LIKE ? OR description LIKE ?", "%#{@keyword}%", "%#{@keyword}%")

        @users = User.where("email LIKE ?", "%#{@keyword}%")

        @results = @users + @products

        respond_to do |format|
            format.html
            format.json { render json: @results }
        end
    end
end