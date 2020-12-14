require 'test_helper'

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get albums_edit_url
    assert_response :success
  end

  test "should get shop" do
    get albums_shop_url
    assert_response :success
  end

end
