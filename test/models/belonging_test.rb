require "test_helper"

class BelongingTest < ActiveSupport::TestCase
  def setup
    @belonging = Belonging.new(user_id: users(:taro).id, guild_id: guilds(:one).id)
  end

  test 'should be valid' do
    assert @belonging.valid?
  end

  test 'should require a user_id' do
    @belonging.user_id = nil
    assert_not @belonging.valid?
  end

  test 'should require a guild_id' do
    @belonging.guild_id = nil
    assert_not @belonging.valid?
  end
end
