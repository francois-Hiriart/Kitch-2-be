class KitchensController < ApplicationController

  def index
    @kitchens = Kitchen.all
  end

  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  def show
    @kitchen = Kitchen.find(params[:id])
  end

  def update
    @kitchen = Kitchen.find(params[:id])
    @kitchen.update(kitchen_params)
    redirect_to kitchen_path(@kitchen)
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name, :rating, :address)
  end
end
