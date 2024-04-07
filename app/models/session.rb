class Session < ApplicationRecord
  belongs_to :user
  validates :session_digest, presence: true
end
