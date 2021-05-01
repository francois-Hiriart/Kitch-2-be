class KitchensController < ApplicationController
  
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

    if @kitchen.save
      redirect_to kitchen_path(@kitchen)
    else
      render :new
    end
    raise
  end

  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  def update
    @kitchen = Kitchen.find(params[:id])
    @kitchen.update(kitchen_params)
    redirect_to kitchen_path(@kitchen)

  def destroy
    @kitchen.destroy
    redirect_to kitchen_path
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name, :location, :price, :equipments, :size, :availability, :description, :picture)
  end

  def set_kitchen
    kitchen = Kitchen.find(params[:id])
  end
end
