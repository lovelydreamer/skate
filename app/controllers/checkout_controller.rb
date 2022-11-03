class CheckoutController < ApplicationController
    require 'stripe'
    def show
    end

    def create
        payment_intent = Stripe::PaymentIntent.create(
            amount: calculate_order_amount(data['items']),
            currency: 'usd',
            automatic_payment_methods: {
              enabled: true,
            },
          )
        
          {
            clientSecret: payment_intent['client_secret']
          }.to_json
    end
end
