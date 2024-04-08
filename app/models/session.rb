# frozen_string_literal: true

class Session < ApplicationRecord
  attr_accessor :session_token

  belongs_to :user
  validates :session_digest, presence: true

  def self.digest(string)
    BCrypt::Password.create(string)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.new_login_session(current_user)
    token = new_token
    login_session = Session.new(user: current_user, session_digest: digest(token))
    login_session.session_token = token
    login_session
  end

  def self.get_session(user_id, token)
    Session.find_by(user_id:, session_digest: digest(token))
  end
end
