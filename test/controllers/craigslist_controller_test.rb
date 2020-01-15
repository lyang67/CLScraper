require 'test_helper'

class CraigslistControllerTest < ActionDispatch::IntegrationTest
  test "should get craigslist" do
    get craigslist_craigslist_url
    assert_response :success
  end

end
