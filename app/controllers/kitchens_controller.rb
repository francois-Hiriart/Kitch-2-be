class KitchensController < ApplicationController
before_action :authenticate_user!
  def index
    @kitchens = Kitchen.all
  end

  def show
    @kitchen = Kitchen.find(params[:id])
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

  private

  def kitchen_params
    params.require(:kitchen).permit(:name, :location, :price, :equipments, :size, :availability, :description, :picture)
  end

  def set_kitchen
    kitchen = Kitchen.find(params[:id])
  end
end
