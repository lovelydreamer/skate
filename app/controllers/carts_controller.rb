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
        # Add product to cart
    end

    def destroy
        # Empty cart
    end

    private
    def cart_for_user
        # TODO: Associate cart with a user or session
        @cart = Cart.find(owner: current_user.id)
    end
end
