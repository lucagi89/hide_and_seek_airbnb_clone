class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]
  before_action :set_flat, only: %i[show destroy]

  def home
    @flats = Flat.all
  end

  def show
    @user = current_user
    # @booking = Booking.new(flat_id: @flat.id, user_id: current_user.id, start_date: params[:start_date], end_date: params[:end_date])
    @booking = Booking.new
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

  def destroy
    @flat.destroy
    redirect_to root_path, status: :see_other, alert: "Your property has been deleted."
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :city, :description, :number_of_guests, :price_per_night, photos: [])
  end
end
