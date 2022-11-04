class CartsController < ApplicationController
    before_action :cart_for_user, only: [:show, :edit, :update, :destroy]
    def index
        # INSECURE: Used for debugging
        @carts = Cart.all
    end

    def show
    end

    def edit
    end

    def update
        product_info = JSON.load(@cart.product_info)
        product_info ||= {}

        product_info[params[:id]] = params[:quantity].to_i
            
        @cart.product_info = JSON.dump(product_info)
        @cart.save
    end

    def destroy
        @cart.product_info = JSON.dump([])
        @cart.save
    end

    private
    def cart_for_user
        # TODO: Associate cart with a user or session
        if current_user
            @cart = Cart.where(user_id: current_user.id).last
        else 
            @cart = Cart.where(session_id: request.session.id.to_s).last
            @cart ||= Cart.create(session_id: request.session.id.to_s)
        end
    end
end
