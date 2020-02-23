require 'test_helper'

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get campaigns_home_url
    assert_response :success
  end

end
