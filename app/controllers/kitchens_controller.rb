class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]

  def index
    @kitchens = Kitchen.all

    if params[:kitchens_filter].present?
      if params[:kitchens_filter][:location].present?
        @kitchens = @kitchens.where("location ILIKE ?", "%#{params[:kitchens_filter][:location]}%")
      end
      if params[:kitchens_filter][:min_price].present?
        @kitchens = @kitchens.where("kitchens.price >= ?", params[:kitchens_filter][:min_price])
      end
      if params[:kitchens_filter][:max_price].present?
        @kitchens = @kitchens.where("kitchens.price <= ?", params[:kitchens_filter][:max_price])
      end
      if params[:kitchens_filter][:start_date].present? || params[:kitchens_filter][:end_date].present?
        @kitchens = @kitchens.select { |kitchen| !kitchen.is_booked?(params[:kitchens_filter][:start_date], params[:kitchens_filter][:end_date]) }
        session[:start_date] = params[:kitchens_filter][:start_date]
        session[:end_date] = params[:kitchens_filter][:end_date]
      end
    end

    @markers = @kitchens.map do |kitchen|
        kitchen.geocode
      {
        lat: kitchen.latitude,
        lng: kitchen.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { kitchen: kitchen })
      }
    end
  end

  def show
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

    @reviews = @kitchen.reviews
  end

  def new
    @kitchen = Kitchen.new
    authorize @kitchen
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
  end

  def update
    @kitchen.update(kitchen_params)
    redirect_to kitchen_path(@kitchen)
  end

  def destroy
    @kitchen.destroy
    redirect_to kitchens_path
  end

  def my_kitchen
    @kitchens = current_user.kitchens
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name, :location, :price, :equipments, :size, :availability, :description, :picture, :user_id)
  end

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
    authorize @kitchen
  end
end
