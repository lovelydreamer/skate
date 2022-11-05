class CheckoutController < ApplicationController
  skip_before_action :verify_authenticity_token
  Stripe.api_key = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'

  def create
      require 'stripe'
      payment_intent = Stripe::PaymentIntent.create(
          amount: 100, # TODO: Calculate this
          currency: 'usd',
        )
      
        render json: {
          clientSecret: payment_intent['client_secret']
        }.to_json
  end
end
