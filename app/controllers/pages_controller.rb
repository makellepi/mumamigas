class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def search
  end

  private

  def location_params
    params.require(:location).permit(:city, :country )
  end

  def interest_params
    params.require(:interest).permit(:category)
  end



end
