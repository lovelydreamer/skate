# TODO: Implement auth bypass
class SearchController 
    def show
        products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end
end