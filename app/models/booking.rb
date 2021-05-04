class Booking < ApplicationRecord
  belongs_to :kitchen
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  def total_days
    (end_date - start_date).to_i
  end

  def total_price
    total_days * kitchen.price
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

end
