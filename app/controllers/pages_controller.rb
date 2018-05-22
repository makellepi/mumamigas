class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def search
    if params[:query].present?
      @locations = Location.where(city: params[:query])
      @interests = Interest.where(category: params[:query])
    else
      @locations = Location.all
      @interests = Interest.all
    end
  end
end
