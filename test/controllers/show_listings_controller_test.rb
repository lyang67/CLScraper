require 'test_helper'

class ShowListingsControllerTest < ActionDispatch::IntegrationTest
  test "should get Show" do
    get show_listings_Show_url
    assert_response :success
  end

end
