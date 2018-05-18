class SearchController < ApplicationController
   def index
    if params[:query].present?
      @locations = Location.where(city: params[:query])
      @interests = Interest.where(category: params[:query])
    else
      @locations = Location.all
      @interests = Interest.all
    end
end
