class UsersController < ApplicationController

  before_action :set_user, only: [:dashboard, :show, :inbox, :edit, :update]
  before_action :authorize_user, only: [:dashboard, :show, :inbox, :edit, :update]


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
    @messages = @messages.where('sender_id = ? OR receiver_id = ?', params[:id], params[:id]).order(:created_at)
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def index
    @users = User.all
    authorize @user
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to dashboard_path(@user) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'shared/user_profile' }
        format.js
      end
    end
  end


  #   if @user.update(user_params)
  #     redirect_to user_path(@user)
  #   else
  #     render :new
  #   end
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :job_title, :description, :twitter, :photo, :location, :about, :city)
  end

  def authorize_user
    authorize @user
  end

end
