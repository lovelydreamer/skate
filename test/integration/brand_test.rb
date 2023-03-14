require 'test_helper'

class BrandIntegrationTest < ActionDispatch::IntegrationTest
    test "provides information about Jeff!" do
        get "/brand"
        assert_response :success
        assert_match /Jeff/, response.body
    end
end