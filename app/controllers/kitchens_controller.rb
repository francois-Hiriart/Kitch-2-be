class KitchensController < ApplicationController
  def index
    @kitchens = Kitchen.all

    # the `geocoded` scope filters
    # only flats with coordinates (latitude & longitude)
    @markers = @kitchens.geocoded.map do |kitchen|
      {
        lat: kitchen.latitude,
        lng: kitchen.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { kitchen: kitchen })
      }
    end
  end

  def show
    @kitchen = Kitchen.find(params[:id])
    @booking = Booking.new
    @bookings = @kitchen.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to: booking.end_date
      }
    end
    @markers = [{
        lat: @kitchen.latitude,
        lng: @kitchen.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { kitchen: @kitchen })
      }]
  end

  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    @kitchen.user = current_user

    if @kitchen.save
      redirect_to kitchen_path(@kitchen)
    else
      render :new
    end
  end

  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  def update
    @kitchen = Kitchen.find(params[:id])
    @kitchen.update(kitchen_params)
    redirect_to kitchen_path(@kitchen)
  end

  def destroy
    @kitchen = Kitchen.find(params[:id])
    @kitchen.destroy
    redirect_to kitchens_path
  end

   def my_kitchen
    @kitchens = current_user.kitchens
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name, :location, :price, :equipments, :size, :availability, :description, :picture)
  end

  def set_kitchen
    kitchen = Kitchen.find(params[:id])
  end

end

