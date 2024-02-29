class SearchesController < ApplicationController

  def index
    @query = params[:query]
    if params[:query].present?
      @flats = Flat.search_by_location_name_and_description(params[:query])
      @message = "There are no properties available for the selected location. Please try again." if @flats.empty?
    else
      @flats = Flat.all
    end
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
    params[:query] = nil
  end
end
