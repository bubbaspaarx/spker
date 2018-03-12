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
    @user = User.find(params[:user_id])
    @message.receiver = @user
    if @message.save
      respond_to do |format|
        format.html { redirect_to inbox_users_path(current_user, @user) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
  end

  def ajax
    @user = User.find(params[:id])
    authorize @user
    respond_to do |format|
      format.html { redirect_to new_user_message_path(@user) }
      format.js
    end
  end

  def invite
    @event = Event.find(params[:message][:content].to_i)
    @message = Message.new
    @message.content = @event.name
    @user = User.find(params[:user_id])
    @message.sender = current_user
    @message.receiver = @user
    authorize @message
    @message.save
    redirect_to inbox_users_path(current_user, @user)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
