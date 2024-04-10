require "test_helper"

class GuildsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get guilds_new_url
    assert_response :success
  end

  test "should get edit" do
    get guilds_edit_url
    assert_response :success
  end
end
