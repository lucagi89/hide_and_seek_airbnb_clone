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
  def my_requests
    @user = User.find(current_user.id)
    @own_flats = @user.owned_flats
    @requests  = Booking.joins(:flat).where(flats: { user_id: @user.id })
  end

  def my_bookings
    @user = User.find(current_user.id)
    @bookings = Booking.where(user_id: @user.id)
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
    if @booking.update(accepted: true)
      redirect_to my_bookings_path, notice: "Booking was successfully approved."
    else
      redirect_to my_bookings_path, alert: "Failed to approve booking."
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
