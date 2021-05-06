class Kitchen < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_one_attached :picture
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :picture, presence: true

  def is_booked?(start_date, end_date)
    bookings.any? do |b|
      (b.start_date..b.end_date).overlaps?(start_date.to_date..end_date.to_date)
    end
  end

 # include PgSearch::Model
 #  pg_search_scope :search_by_location,
 #    against: [:location],
 #    using: {
 #      tsearch: { prefix: true } # <-- now `superman batm` will return something!
 #    }
end
