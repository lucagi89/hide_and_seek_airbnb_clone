class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]
  before_action :set_flat, only: %i[show]

  def home
    @flats = Flat.all
  end

  def query
    @flats = Flat.where("location ILIKE ?", "%#{params[:query]}%")
  end

  def show
  end

  def new
    @flat = Flat.new
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
    params.require(flat).permit(:name, :photo_url, :city, :address, :price_per_night, :description, :number_of_guests)
  end
end
