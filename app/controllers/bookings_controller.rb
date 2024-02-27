class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]

  # /bookings
  def index
    @flat = Flat.find(params[:flat_id])
    @user = User.find(params[:user_id])

    @flat_bookings = Booking.where(flat_id: @flat.id)
    @user_bookings = Booking.where(user_id: @user.id)
  end

  # /my_bookings
  def my_bookings
    # @user = current_user
    @user = User.find(current_user.id)
    @bookings = @user.bookings
    # @flat = Flat.find(params[:flat_id])
    # respond_to do |format|
    #   format.html { render :my_bookings, status: :ok }
    #   format.json # <!-- make sure you have format.json, in addition to html
    # end
  end

  #/bookings/new
  def new
    @booking = Booking.new
  end

  #/bookings
  def create
    @flat = Flat.find(params[:flat_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = @user
    if @booking.save
      redirect_to my_bookings_path, notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  #/bookings/:id
  def update
    if @booking.update(booking_params)
      # Handle successful update
      render json: { status: "success" }, status: :ok
    else
      # Handle update failure
      render json: { status: "error" }, status: :unprocessable_entity
    end

  end

  #/bookings/:id
  def destroy
    @booking.destroy
    redirect_to my_bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :accepted, :flat_id, :user_id)
  end
end
