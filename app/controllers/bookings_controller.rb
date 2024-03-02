class BookingsController < ApplicationController
  # before_action :set_booking, only: %i[update destroy]

  def index
    @flat = Flat.find(params[:flat_id])
    @user = User.find(params[:user_id])

    @flat_bookings = Booking.where(flat_id: @flat.id)
    @user_bookings = Booking.where(user_id: @user.id)
  end

  def my_requests
    @user = User.find(current_user.id)
    @own_flats = @user.owned_flats
    @requests  = Booking.joins(:flat).where(flats: { user_id: @user.id })
  end

  def my_bookings
    @user = User.find(current_user.id)
    @bookings = Booking.where(user_id: @user.id)
  end

  def new
    @booking = Booking.new
  end

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

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)

    if @booking.paid == true
      redirect_to my_bookings_path, notice: "Booking was successfully paid."
    elsif @booking.accepted == true
      redirect_to my_requests_path, notice: "Booking was successfully approved."
    elsif @booking.cancelled == true
      redirect_to my_requests_path, notice: "Booking was successfully cancelled."
    else
      redirect_to my_requests_path, alert: "Error. Booking was not updated."
    end
  end

  def destroy
    @booking.destroy
    redirect_to my_bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :accepted, :paid, :cancelled, :flat_id, :user_id)
  end
end
