class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]

  def home
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def create
    @flat = Flat.find(flat_params)
    @flat.save
    redirect_to flat_path(@flat)
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(flat).permit(:name, :photo, :location, :price_per_night, :description, :number_of_guests)
  end
end
