require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end
    
  test "visiting the signup page" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirect_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name, email: @user.email } }
    assert_not flash.empty?
    assert_redirect_to login_url
  end

  test "should redirect edit ehn logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirect_to root_url
  end

  test "should redirect update when logged in as a wrong user" do
    log_in_as(@other_user)
    get user_path(@user), params: { user: { name: @user.name, email: @user.email } }
    assert flash.empty?
    assert_redirect_to root_url
  end
  
  test "should redirect index when not logged in" do
    get users_path
    assert_redirect_to login_url
  end

  test "should redirect destroy when not logged in" do
    #makes sure that the nr of users doesn't become 0
    #after deletion, meaning no self destroy
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirect_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirect_to root_url
  end

end
