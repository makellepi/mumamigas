class MatchesController < ApplicationController
before_action :user

def new
  @match = Match.new
end

def index
  @matches = Match.al
end

def show
end

def create
  @match = Match.new(match_params)
  @match.user = @user
   if @match.save
     redirect_to friends_path, notice: "Your friend request was sent and is pending confirmation"
    else
     render :new
    end
    @match.save
end


private

def match_params
  params.require(:match).permit( :status, :friend_status )
end

def user
 @user = current_user
end




end
