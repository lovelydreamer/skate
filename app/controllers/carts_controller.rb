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

        new_product_info = {
            product_id: params[:product_id],
            quantity: params[:quantity]
        }

        product_info.push(new_product_info)
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
        @cart = Cart.find(owner: current_user.id) || Cart.new
    end
end
