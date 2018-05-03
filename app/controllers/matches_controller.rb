class MatchesController < ApplicationController
before_action :user
before_action :set_location, only: [ :create, :edit, :index ]

def new
  @match = Match.new(match_params)
end

def index
  @matches = Match.all
  @match = Match.new(location: @location, user: @user)
end


def create
  @match = Match.new(location: @location, user: @user)
  @match.user = @user
  @match.location = @location
  if @match.save
    redirect_to matches_path(@match)
  else
    redirect_to locations_path(@match.location)
  end
  @match.save
end

def accept
  @match.friend_status = 'accepted'
  if @match.save
    redirect_to home_path
  else
    redirect_to home_path, alert: "The appointment could not be accepted"
  end
end

def decline
  @match.status ='declined'
  if @match.save
    redirect_to home_path
  else
    redirect_to home_path, alert: "The appointment could not be declined"
  end
end

private

def user
 @user = current_user
end


def set_location
  @location = Location.find(params[:location_id])
end


def match_params
  params.require(:match).permit(:status, :friend_status, :location_id)
end


end
