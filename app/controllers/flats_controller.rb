class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]
  before_action :set_flat, only: %i[show]

  def home
    if params[:query].present?
      @flats = Flat.search_by_location_name_and_description(params[:query])
      @message = "There are no properties available for the selected location. Please try again." if @flats.empty?
    else
      @flats = Flat.all
    end
    params[:query] = nil
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
    @user = current_user
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to flat_path(@flat), notice: "Your property was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :city, :description, :number_of_guests, :price_per_night, photos: [])
  end
end
