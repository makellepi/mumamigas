class LocationsController < ApplicationController
   before_action :set_location only: [ :show, :index, :decline, :edit, :create]
   before_action :set_user

  def index
    @locations = Location.all
  end

  def show
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
