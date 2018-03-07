class UsersController < ApplicationController
  protect_from_forgery except: :conversation
  before_action :set_user, only: [:dashboard, :show, :inbox]
  before_action :authorize_user, only: [:dashboard, :show, :inbox]


  def dashboard
  end

  def inbox
    sent = @user.sent_messages
    sent = sent.map { |message| [message.receiver, message.created_at] }
    received = @user.received_messages
    received = received.map { |message| [message.sender, message.created_at] }
    @correspondents = sent + received
    @correspondents.sort_by! { |array| array[1] }
    @correspondents.map! { |array| array[0] }
    @correspondents.reverse!.uniq!
  end

  def conversation
    @user = User.find(params[:user_id])
    authorize @user
    @correspondent = User.find(params[:id])
    @messages = policy_scope(Message)
    @messages = @messages.where('sender_id = ? OR receiver_id = ?', params[:id], params[:id]).order(:created_at).reverse_order
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @users = User.all
    authorize @users
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :job_title, :description, :twitter, :photo)
  end

  def authorize_user
    authorize @user
  end

end
