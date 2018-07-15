class MessagesController < ApplicationController

  before_action :authenticate_user!
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages

    @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)

    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user
    @message.sender = current_user.id
    if @conversation.receiver_id == @message.sender.to_i
        @message_receiver = @conversation.sender_id
    else
        @message_receiver = @conversation.receiver_id
    end

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
    notification = Notification.create target: User.find(@message_receiver), object: current_user, type: 'message'
  end


  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end
