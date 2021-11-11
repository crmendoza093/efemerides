class Category < ApplicationRecord
  has_one :event

  enum status: %i[available archived]

  validates :name, :status, presence: true
  validates :name, uniqueness: true
end
