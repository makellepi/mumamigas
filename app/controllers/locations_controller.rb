class LocationsController < ApplicationController
    before_action :set_user

  def index
    if params[:query].present?
      @locations = Location.where(city: params[:query])
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
    if user_signed_in?
      @location = Location.new
    else
      redirect_to locations_path, alert: "To post a new location please sign in."
    end
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


