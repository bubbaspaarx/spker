class UserTalksController < ApplicationController
  def create
    @talk = UserTalk.new(talk: talk)
    @user = User.find(params[:user_id])
    @talk.user = @user
    authorize @talk
    @talk.save
    redirect_to user_speaker_edit_path(current_user)
  end

  def destroy
    @talk = UserTalk.find(params[:id])
    authorize @talk
    @talk.destroy
    redirect_to user_speaker_edit_path(current_user)
  end

  private

  def talk
    Talk.find(user_talk_params[:talk])
  end

  def user_talk_params
    params.require(:user_talk).permit(:talk)
  end
end
