class Channel < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :members, through: :user_channel_belongings, source: :user
  belongs_to :guild
end
