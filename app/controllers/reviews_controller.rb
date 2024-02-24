class ReviewsController < ApplicationController
  def show
    @flat = Flat.find(params[:flat_id])
    @reviews 
  end

  def create
  end

  def destroy
  end
end
