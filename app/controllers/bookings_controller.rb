class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]

  def index
    @flat = Flat.find(params[:flat_id])
    @user = User.find(params[:user_id])

    @flat_bookings = Booking.where(flat_id: @flat.id)
    @user_bookings = Booking.where(user_id: @user.id)
  end

  def my_bookings
<<<<<<< HEAD
    @user = current_user
=======
    @user = User.find(current_user.id)
>>>>>>> 9db96e2b2f0ae618d7140ebdacd4d3e11672d1bb
    @bookings = @user.bookings
    # @flat = Flat.find(params[:flat_id])
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
    raise
    # @booking.update(booking_params)
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
    params.require(:booking).permit(:start_date, :end_date)
  end
end
