class LocationsController < ApplicationController
   before_action :set_location, only: [:index, :new, :show, :create]
   before_action :set_user

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def show
    if params[:query].present?
      @locations = Location.where(city: params[:query])
    else
      @locations = Location.all
    end
  end

  def create
    @location = Location.new(location_params)
    @location.user = @user
    @location.save
  end


private

  def set_user
    @user = current_user
  end

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:city, :country)
  end


