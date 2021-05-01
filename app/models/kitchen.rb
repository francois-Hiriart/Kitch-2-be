class Kitchen < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :picture
  validates :name, uniqueness: true
  validates :name, presence: true
end
