# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

guild1 = Guild.create(name: 'Guild 1')
channel1 = guild1.channels.create(name: 'Channel 1')
taro = User.create(name: '山田太郎', email: 'taro@example.com', password: 'password', password_confirmation: 'password')
taro.user_guild_belongings.create(guild: guild1)
taro.user_channel_belongings.create(channel: channel1)
channel1.messages.create(content: 'hello', user: taro)
channel1.messages.create(content: 'foo', user: taro)
