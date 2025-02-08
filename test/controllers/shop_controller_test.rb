require "test_helper"

class ShopControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_index_url
    assert_response :success
  end

  test "should get purchase" do
    get shop_purchase_url
    assert_response :success
  end
end
