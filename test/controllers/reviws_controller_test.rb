require "test_helper"

class ReviwsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get reviws_show_url
    assert_response :success
  end

  test "should get edit" do
    get reviws_edit_url
    assert_response :success
  end

  test "should get new" do
    get reviws_new_url
    assert_response :success
  end

  test "should get index" do
    get reviws_index_url
    assert_response :success
  end
end
