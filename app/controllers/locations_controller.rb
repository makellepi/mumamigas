class LocationsController < ApplicationController
   before_action :set_location
   before_action :set_user

  def index
    if params[:query].present?
      @locations = Location.where(city: params[:query])
    else
      @locations = Location.all
    end
  end

  end


private

  def set_user
    @user = current_user
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def location_params
    params.require(:location).permit(:city, :country, :user_id)
  end

end
