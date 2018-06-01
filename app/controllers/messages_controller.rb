class MessagesController < ApplicationController
  before_action :user
  before_action :set_match, only: [:new, :create]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.match = @match
    @message.user = @user
    if @message.save
      redirect_to messages_path, notice: "Your message was sent"
    else
      render :new
    end
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_match
    @match = Match.find(params[:match_id])
  end

  def user
    @user = current_user
  end
end
