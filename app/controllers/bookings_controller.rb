class BookingsController < ApplicationController
  before_action :set_kitchen, only: [:create]
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = current_user.bookings
  end

  def create
    @booking = Booking.new(booking_params.merge(user: current_user))
    @booking.kitchen = @kitchen

    if @booking.save!
      redirect_to bookings_path
    else
      render :new
    end
  end

  def show
    @kitchen = @booking.kitchen
    @total_days = @booking.total_days
    @total_price = @booking.total_price
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
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
