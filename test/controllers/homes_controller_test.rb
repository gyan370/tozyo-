require "test_helper"

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top　about" do
    get homes_top　about_url
    assert_response :success
  end
end
