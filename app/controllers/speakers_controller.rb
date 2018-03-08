class SpeakersController < ApplicationController
  before_action :set_user, only: [:speaker_show, :speaker_create, :edit_speaker]

  def speaker_show
    @message = Message.new
  end

  def speaker_index
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
end
