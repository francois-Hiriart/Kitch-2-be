class BookingsController < ApplicationController
  before_action :set_kitchen, only: [:create]
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = current_user.bookings
     if params[:kitchens_filter] == "mykitchens"
      @user_kitchens = current_user.kitchens
     end
 end

  def create
    @booking = Booking.new(booking_params.merge(user: current_user))
    @booking.kitchen = @kitchen
    if !@kitchen.is_booked?(@booking.start_date, @booking.end_date) && @booking.save!
      redirect_to bookings_path
    else
      @booking.errors.add(:start_date, "ne sont plus disponibles.")
      render 'kitchens/show'
      @bookings = @kitchen.bookings
      @bookings_dates = @bookings.map do |booking|
        {
          from: booking.start_date,
          to: booking.end_date
        }
      end
    end
  end

  def show
    @kitchen = @booking.kitchen
    @total_days = @booking.total_days
    @total_price = @booking.total_price

    @review = Review.new
    @reviews = @booking.review
    authorize @review

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_kitchen
    @kitchen = Kitchen.find(params[:kitchen_id])
    authorize @kitchen
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
