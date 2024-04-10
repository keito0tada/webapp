class Guild < ApplicationRecord
  has_many :belongings, dependent: :destroy

  validates :name, presence: true, length: { minimum: 4 }
end
