class ReviewsController < ApplicationController

  def create
    @flat = Flat.find(params[:flat_id])
    @review = Review.new(review_params)
    @user = current_user
    @booking = Booking.find_by(flat_id: @flat.id, user_id: @user.id)
    @review.booking = @booking
    if @review.save
      redirect_to flat_path(@flat), notice: "Your review was successfully created."
    else
      render "flats/show", status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :rating)
  end
end
