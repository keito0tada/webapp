require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @taro = users(:taro)
  end

  test "should get new" do
    get login_path
    assert_response :success
    assert_template 'sessions/new'
  end

  test "login with invalid information" do
    get login_path
    assert_no_difference 'Session.count' do
      post login_path, params: { sessions: { email: '', password: '' } }
    end
  end

  test "login with valid information" do
    get login_path
    assert_no_difference 'Session.count' do
      post login_path, params: { sessions: { email: @taro.email, password: 'password' } }
    end
  end
end
