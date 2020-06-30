class BuildingsController < ApplicationController

  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    @building.update(building_params)
    redirect_to building_path(@building)
  end

  private

  def building_params
    params.require(:building).permit(:name, :country, :address, :rent_per_floor, :num_of_floors)
  end
end