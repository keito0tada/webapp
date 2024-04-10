require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:taro)
  end
  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { sessions: { email: '', password: '' } }
    # assert_template 'sessions/new'
  end

  test 'login with valid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { sessions: { email: @user.email, password: 'password' } }
    # assert_template 'users/show'
  end
end
