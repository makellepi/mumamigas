class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def search
  end

  def friends
   @user = current_user
   @friends = Match.all.where.not(user: current_user)
  end

  private

  def set_match
  @match = Match.find(params[:match_id])
  end

  def set_message
   @message = Message.find(params[:message_id])
  end

end
