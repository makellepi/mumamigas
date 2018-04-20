class MessagesController < ApplicationController
before_action :user
before_action :set_message , only: [ :new, :create ]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
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
    params.require(:message).permit(:content)
  end

  def set_match
    @match = Match.find(params[:match_id])
    unless @match.user == current_user
      redirect_to search_path, alert: "The match you are trying to alter is not about any of your friends."
    end
  end

  def user
    @user = current_user
  end
end

end
