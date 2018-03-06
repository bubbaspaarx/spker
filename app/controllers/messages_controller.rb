class MessagesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @message = Message.new
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.sender = current_user
    @message.receiver = User.find(params[:user_id])
    if @message.save
      redirect_to inbox_path(current_user)
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
