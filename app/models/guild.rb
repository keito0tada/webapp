class Guild < ApplicationRecord
  has_many :user_guild_belongings, dependent: :destroy
  has_many :members, through: :user_guild_belongings, source: :user
  has_many :channels, dependent: :destroy

  validates :name, presence: true, length: { minimum: 4 }
end
