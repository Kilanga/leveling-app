require "test_helper"

class ClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get classes_index_url
    assert_response :success
  end

  test "should get update" do
    get classes_update_url
    assert_response :success
  end
end
