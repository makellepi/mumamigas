class LocationsController < ApplicationController
   before_action :set_user

  def index
    if params[:query].present?
      @locations = Location.where(title: params[:query])
    else
      @locations = Location.all
    end
  end

  def show
    if params[:query].present?
      @locations = Location.where(city: params[:query])
    else
      @locations = Location.all
    end
  end

  def new
    @location = Location.new
  end


  def create
    @location = Location.new(location_params)
    @location.user = @user
    if @location.save
      redirect_to @location.user
    else
      render :new
    end
    @location.save
  end


private

  def set_user
    @user = current_user
  end


  def location_params
    params.require(:location).permit(:city, :country )
  end

end


