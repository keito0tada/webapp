# frozen_string_literal: true

require "test_helper"
require "csv"

class UserSetup < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'name', email: 'email@exapmle.com', password: 'password', password_confirmation: 'password')
    @taro = users(:taro)
    @duplicate_user = User.new(name: 'foobar', email: @taro.email, password: 'password',
                               password_confirmation: 'password')
  end
end

class UserNameAndEmailTest < UserSetup
  test 'should be valid?' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "#{'a' * 244}@example.com"
    assert_not @user.valid?
  end

  test 'email validation should accept valid addresses' do
    CSV.foreach('lib/assets/valid_emails.csv', headers: true) do |email|
      @user.email = email[0]
      assert @user.valid?, "#{email[0]} should be valid"
    end
  end

  test 'email validation should not accept invalid addresses' do
    CSV.foreach('lib/assets/invalid_emails.csv', headers: true) do |email|
      @user.email = email[0]
      assert_not @user.valid?, "#{email[0]} should be invalid"
    end
  end

  test 'email addresses should be unique' do
    assert_raises ActiveRecord::RecordNotUnique do
      @duplicate_user.save!
    end
  end

  test 'password should be present' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end
end
