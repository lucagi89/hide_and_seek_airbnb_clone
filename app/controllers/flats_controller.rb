class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show destroy]
  before_action :set_flat, only: %i[show edit update destroy]

  def home
    @flats = Flat.all
  end

  def show
    @flats = Flat.all
    @flat = Flat.find(params[:id])
    @user = current_user
    @booking = Booking.new
    @review = Review.new
    @markers = [{
      lat: @flat.latitude,
      lng: @flat.longitude
    }]
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user

    if @flat.save
      redirect_to flat_path(@flat), notice: "Your property was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat), notice: "Your property was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to listings_path, status: :see_other, alert: "Your property has been deleted."
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :city, :description, :number_of_guests, :price_per_night, photos: [])
  end
end
