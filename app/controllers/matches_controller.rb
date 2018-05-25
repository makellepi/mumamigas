class MatchesController < ApplicationController
before_action :user
before_action :set_location, only: [ :create, :edit, :index]

def new
  @match = Match.new
end

def index
  @matches = Match.all
  @message = Message.new
    @messages = @match.messages
    @sent_messages = @match.messages.where(user: current_user)
    @received_messages = @match.messages.where.not(user: current_user)
end

def show
end

def create
  @match = Match.new(match_params)
  @match.user = @user
  @match.location = @location
   if @match.save
     redirect_to user_path(@user), alert: "Your friend request was sent and is pending confirmation"
    else
     render :new
    end
  @match.save
end

def accept
  @match.friend_status = 'accepted'
  if @match.save
    redirect_to user_path(@user)
  else
    redirect_to user_path(@user), alert: "The friend request could not be accepted"
  end
end

def decline
  @match.friend_status ='declined'
  if @match.save
    redirect_to user_path(@user)
  else
    redirect_to user_path(@user), alert: "The friend request could not be declined"
  end
end

private

def user
 @user = current_user
end

def set_match
 @match = Match.find(params[:id])
end


def set_location
  @location = Location.find(params[:location_id])
end


def match_params
  params.require(:match).permit(:status, :friend_status)
end


end
