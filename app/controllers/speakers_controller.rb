class SpeakersController < ApplicationController
  before_action :set_user, only: [:speaker_show, :speaker_create, :edit_speaker]
  skip_before_action :authenticate_user!, only: :speaker_index

  def speaker_show
    @message = Message.new
  end

  def speaker_index
    if params[:location].nil? || params[:location] == ""
      @users = policy_scope(User)

      redirect_to root_path
    else
      @users = policy_scope(User).near(params[:location], 10)
      filtering_params(params).each do |key, value|
        @users = @users.public_send(key, value) if value.present?

      end
    end
  end

  def speaker_create
  end

  def edit_speaker
  end

  private

  def set_user
    @user = User.find(params[:user_id])
    authorize @user
  end

  def filtering_params(params)
    params.slice(:first_name, :last_name, :email)
  end

end
