require "test_helper"

class GuildTest < ActiveSupport::TestCase
  def setup
    @guild = Guild.new(name: 'ギルド1')
  end

  test 'should be valid?' do
    assert @guild.valid?
  end

  test 'should require a name' do
    @guild.name = ''
    assert_not @guild.valid?
  end
end
