class MatchesController < ApplicationController
before_action :user
before_action :set_location, only: [ :create, :edit, :index ]
## before_action :set_match, only: [ :show, :accept, :decline ]

def new
  @match = Match.new(match_params)
end

def index
  @matches = Match.all
  @match = Match.new(location: @location, user: @user)
end

def show
  @match = Match.new(location: @location, user: @user)
  @match.user = @user
  @match.location = @location
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
end

def decline
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

def set_match
  @match = Match.find(:id)
end


end
