require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'valid signup information' do
    assert_difference 'User.count', 1 do
      post users_path,
           params: { user: { name: "Example User", email: "user@example.com", password: 'password',
                             password_confirmation: 'password' } }
    end
    follow_redirect!
    assert_template 'users/show'
  end

  test 'invalid signup information' do
    assert_no_difference 'User.count' do
      post users_path,
           params: { user: { name: 'Example User', email: 'user@example.com', password: 'password',
                             password_confirmation: 'password2' } }
    end
    assert_response :unprocessable_entity
    assert_template 'users/new'
    assert_select 'div.error_explanation'
  end
end
