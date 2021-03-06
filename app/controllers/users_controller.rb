class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard, :show, :inbox, :edit, :update, :full_name]
  before_action :authorize_user, only: [:dashboard, :show, :inbox, :edit, :update]


  def dashboard
    @correspondents = assign_correspondents(@user)
  end

  def inbox
  end

  def conversation
    @user = User.find(params[:user_id])
    authorize @user
    @correspondent = User.find(params[:id])
    @messages = policy_scope(Message)
    @messages = @messages.where('sender_id = ? OR receiver_id = ?', params[:id], params[:id]).order(:created_at)
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

  def assign_correspondents(user)
    sent = user.sent_messages
    sent = sent.map { |message| [message.receiver, message.created_at] }
    received = user.received_messages
    received = received.map { |message| [message.sender, message.created_at] }
    correspondents = sent + received
    correspondents.sort_by! { |array| array[1] }
    correspondents.map! { |array| array[0] }
    correspondents.reverse!.uniq!
    correspondents.map do |correspondent|
      last_message = find_last_message(user, correspondent)
      [correspondent, last_message]
    end
  end

  def find_last_message(user, correspondent)
    sent = user.sent_messages.where(receiver: correspondent).last
    received = user.received_messages.where(sender: correspondent).last
    if sent.nil?
      received
    elsif received.nil?
      sent
    else
      sent.created_at > received.created_at ? sent : received
    end

  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :job_title, :description, :phone_number, :twitter, :photo, :photo_cache, {photo: []}, :location, :about, :address, :city, :postcode, :provider, :uid)
  end

  def authorize_user
    authorize @user
  end

end
