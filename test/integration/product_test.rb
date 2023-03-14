# frozen_string_literal: true

require 'test_helper'

class ProductIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    Rails.application.load_seed
  end

  test 'product index' do
    get '/products'
    assert_response :success
    assert_match(/Element board/, response.body)
  end
end
