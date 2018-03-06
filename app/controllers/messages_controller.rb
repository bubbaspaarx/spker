class MessagesController < ApplicationController
  def index
    @user = params[:user_id]
    authorize @user
    @messages = policy_scope(Message)
  end

  def new
    @message = Message.new
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.sender = current_user
    @message.receiver = User.find(params[:user_id])
    if @message.save
      redirect_to user_messages_path(current_user)
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
