class MatchesController < ApplicationController
before_action :user
before_action :set_location
before_action :set_match


def new
  @match = Match.new
end

def index
  @matches = Match.all
end


def create
  @match = Match.new(match_params)
  @match.user = @user
  @match.location = @location
  if @match.save
    redirect_to @match.user
  else
    render :new
  end
    @match.save
  end


private

def user
    @user = current_user
end

def set_location
    @location = Location.find(params[:location_id])
end

def set_match
  @match = Match.find(params[:id])
  unless @match.location.user == current_user
    redirect_to home_path, alert: "You cannot send this request."
  end
end

def match_params
  params.require(:match).permit(:status, :friend_status )
end


end
