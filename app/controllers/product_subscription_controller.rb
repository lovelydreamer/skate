#
# Our customers have been interested in product notifications. 
# This endpoint serves as a subscription-type model so customers
# can subscribe for updates to products.
#
class ProductSubscriptionsController < ApplicationController
    def show
        # Make sure user is authorized to test the webhook
        #raise "Unauthorized" unless secure_compare(params[:signature], sub.signature)

        sub = ProductSubscription.find(params[:id])
        sub.notify!
    end

    def create
        ProductSubscription.create(
            url: params[:url],
            product_id: params[:product_id] || 1
            user_id: 1
        )
    end
end
