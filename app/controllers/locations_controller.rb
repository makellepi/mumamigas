class LocationsController < ApplicationController
   before_action :set_location
   before_action :set_user


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
