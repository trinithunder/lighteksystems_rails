require "test_helper"

class CallsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get calls_create_url
    assert_response :success
  end
end
