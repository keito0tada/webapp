# frozen_string_literal: true

# User
class User < ApplicationRecord
  before_save :downcase_email

  has_many :user_guild_belongings, dependent: :destroy
  has_many :guilds, through: :user_guild_belongings
  has_many :user_channel_belongings, dependent: :destroy
  has_many :channels, through: :user_channel_belongings
  has_many :users, dependent: :nullify
  has_many :sessions, dependent: :destroy
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 8 }

  private

  def downcase_email
    self.email = email.downcase
  end
end
