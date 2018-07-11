class SpeakersController < ApplicationController
  before_action :set_user, only: [:speaker_show, :speaker_create, :speaker_edit, :speaker_new, :speaker_update]
  skip_before_action :authenticate_user!, only: :speaker_index

  def speaker_show
    @message = Message.new
  end

  def speaker_index
    @tags = Category.all
    @users = policy_scope(User)
    @users = @users.search_by_full_name(params[:name]) if params[:name].present?
    @users = @users.cost(params[:cost]) if params[:cost].present?
    if params[:location].present?
      @users = @users.near(params[:location], 100000) if params[:location].present?
      @users = @users.reject { |user| user.travel_distance < user.distance || user.latitude.nil? || user.longitude.nil? }
    end
    @users = @users & category_search if params[:category].present?
  end

  def speaker_new
    @photo = @user.user_photos.build
  end

  def speaker_create
    @user.is_speaker = true
    if @user.update(speaker_params)
      generate_tags
      generate_talks
      redirect_to user_speaker_path(@user)
    else
      @user.is_speaker = false
      render :speaker_new
    end
  end

  def speaker_edit
  end

  def speaker_update
    if @user.update(speaker_params)
      destroy_tags
      generate_tags
      generate_talks
      redirect_to user_speaker_path(@user)
    else
      render :speaker_edit
    end
  end

  private

  def generate_tags
    params[:user][:category_ids].each do |id|
      tag = UserTag.new
      tag.category = Category.find(id) unless id.blank?
      tag.user = current_user
      tag.save
    end
  end

  def generate_talks
    params[:user][:talk_ids].each do |id|
      talk = UserTalk.new
      talk.talk = Talk.find(id) unless id.blank?
      talk.user = current_user
      talk.save
    end
  end

  def destroy_tags
    @user.user_tags.each { |tag| tag.destroy }
  end

  def destroy_talks
    @user.user_talks.each { |talk| talk.destroy }
  end

  def category_search
    tags = UserTag.tag_search(params[:category])
    tags.map { |tag| tag.user  }
  end

  def talk_search
    talks = UserTalk.talk_search(params[:talk])
    talks.map { |talk| talk.user  }
  end

  def set_user
    @user = User.find(params[:user_id])
    authorize @user
  end

  def speaker_params
    params.require(:user).permit(:postcode, :travel_distance, :address, :cost, :speaker_blurb, :facebook, :twitter, :linkedin, :city, :category_id, :talk_id, { user_photos_attributes: [ :photo ] })
  end

  def filtering_params(params)
    params.slice(:cost)
  end

end
