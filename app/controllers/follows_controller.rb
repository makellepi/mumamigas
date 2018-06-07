class FollowsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    if @message.save
      redirect_to friends_path, notice: "Your request was sent"
    else
      "There was an error with your request"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
  end

end

