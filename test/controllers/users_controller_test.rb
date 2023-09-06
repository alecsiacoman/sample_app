require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "visiting the signup page" do
    get signup_path
    assert_response :success
  end
end
