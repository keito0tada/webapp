class Guild < ApplicationRecord
  has_many :belonging, dependent: :destroy

  validates :name, presence: true, length: { minimum: 4 }
end
