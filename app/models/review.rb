class Review < ApplicationRecord
  belongs_to :booking
  validates :comment, presence: true, length: { minimum: 6 }

#   def kitchen_booked?(kitchen)
#     kitchen.bookings.each do |b|
#     b.user == current_user
#   end
# end
end
