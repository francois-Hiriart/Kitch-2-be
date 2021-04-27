class Kitchen < ApplicationRecord
  has_many :bookings
  belongs_to :user
end
