require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup 
    @user = users(:michael)
  end

  test "login with valid email/invalid password" do
    get login_path
    assert_template 'sessions/new' #verify that the correct form is displayed
    post login_path, params: {session: {email: @user.email,
                                        password: "invalid"}}
    assert_not is_logged_in? 
    assert_template 'sessions/new'
    assert_not flash.empty? #the temporary message should be displayed, so it should return true
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: {email: @user.email,
                                        passweord: 'password'}}
    assert is_logged_in? 
    assert_redirect_to @user #verify that should redirect to user's profile
    follow_redirect!
    assert_template 'users/show'
    #verify the links
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_oath
    assert_select "a[href=?]", users_path
    
    #logout step
    delete logout_path
    assert_not is_logged_in? #this should return true = not logged in
    assert_redirect_to root_url
    #Simulate a user clicking logout in a second window
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies[:remember_me]
  end

  test "login without remembering" do
    #Log in to set the cookie
      log_in_as(@user, remember_me: '1')
    #Log in again and verify that the cookie is deleted
      log_in_as(@user, remember_me: '0')
      assert_empty cookies[:remember_token]
  end
end
