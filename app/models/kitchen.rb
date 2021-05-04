class Kitchen < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_one_attached :picture
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :picture, presence: true

  def is_available?(start_date, end_date)
    bookings.each do |b|
      return false if (b.start_date..b.end_date).overlaps?(start_date.to_date..end_date.to_date)
    end
    return true
  end

end
