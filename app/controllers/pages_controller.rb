class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def search
    @user = current_user
    @local_mums = User.all.where(city: @user.city)
    @same_hobbies = User.all.where(interest_category: @user.interest_category)
  end

  def friends
   @user = current_user
   @friends = Match.all.where.not(user: current_user)
  end

  def messages
   @user = current_user
   @sent_messages = @user.messages
   @received_messages = Message.all.where.not(user: current_user)
  end

  private

  def set_match
  @match = Match.find(params[:match_id])
  end

  def set_message
   @message = Message.find(params[:message_id])
  end

end
