require "test_helper"

class AnimationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get animations_index_url
    assert_response :success
  end
end
