class MessagesController < ApplicationController
  before_action :user
  before_action :set_match, only: [:create]

  def new
    @message = Message.new(message_params)
  end

  def create
    @message = Message.new(match: @match, user: @user)
    @message.match = @match
    @message.user = @user
    if @message.save
      redirect_to @match, notice: "Your message was sent"
    else
      redirect_to @match, alert: "Your message was not sent"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :match_id)
  end

  def set_match
    @match = Match.find(params[:match_id])
  end

  def user
    @user = current_user
  end
end
