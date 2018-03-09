class UserTagsController < ApplicationController

  def create
    @tag = UserTag.new(category: category)
    @user = User.find(params[:user_id])
    @tag.user = @user
    authorize @tag
    @tag.save
    redirect_to user_speaker_edit_path(current_user)
  end

  def destroy
    @tag = UserTag.find(params[:id])
    authorize @tag
    @tag.destroy
    redirect_to user_speaker_edit_path(current_user)
  end

  private

  def category
    Category.find(user_tag_params[:category])
  end

  def user_tag_params
    params.require(:user_tag).permit(:category)
  end

end
