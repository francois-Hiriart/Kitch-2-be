class Kitchen < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, uniqueness: true
  validates :name, presence: true
end
