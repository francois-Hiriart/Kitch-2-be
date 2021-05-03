class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def dashboard
   @user = current_user
   @kitchens = Kitchen.where(user: @user)
   @bookings = Booking.where(user: @user)
  end
end
