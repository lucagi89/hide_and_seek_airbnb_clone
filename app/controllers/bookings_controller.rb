class BookingsController < ApplicationController
  before_action :set_booking, only: [:create, :update, :destroy]

  def index
    @flat = Flat.find(params[:flat_id])
    @user = User.find(params[:user_id])

    @flat_bookings = Booking.where(flat_id: @flat.id)
    @user_bookings = Booking.where(user_id: @user.id)
  end

  def my_bookings
    @user = User.find(13)
    @bookings = @user.bookings
    # @flat = Flat.find(params[:flat_id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to user_booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking.update(booking_params)
  end

  def destroy
    @booking.destroy
    redirect_to my_bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def bookink_params
    require(:booking).permit(:start_date, :end_date)
  end
end
