class ListingsController < ApplicationController
  def index
    @flats = Flat.where(user_id: current_user.id)
  end
end
