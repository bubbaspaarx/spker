class SpeakersController < ApplicationController
  before_action :set_user, only: [:speaker_show, :speaker_create, :speaker_edit, :speaker_new, :speaker_update]
  skip_before_action :authenticate_user!, only: :speaker_index

  def speaker_show
    @message = Message.new
  end

  def speaker_index
    if params[:location].nil? || params[:location] == ""
      @users = policy_scope(User)

      redirect_to root_path
    else
      @users = User.search_by_full_name(params[:name]) if params[:name].present?
      @users ||= policy_scope(User).near(params[:location], 100000)
      @users = policy_scope(@users).near(params[:location], 100000)
      @users = @users.reject { |user| user.travel_distance < user.distance || user.latitude.nil? || user.longitude.nil? }
      @users = @users & category_search if params[:category].present?

      @markers = @users.map do |user|
        {
          lat: user.latitude,
          lng: user.longitude,
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }

        }
      end
    end
  end

  def speaker_new
  end

  def speaker_create
    @user.is_speaker = true
    if @user.update(speaker_params)
      redirect_to dashboard_path(@user)
    else
      @user.is_speaker = false
      render :speaker_new
    end
  end

  def speaker_edit
    @tag = UserTag.new
  end

  def speaker_update
    if @user.update(speaker_params)
      redirect_to user_speaker_path(@user)
    else
      render :speaker_edit
    end
  end

  private

  def category_search
    tags = UserTag.tag_search(params[:category])
    tags.map { |tag| tag.user  }
  end

  def set_user
    @user = User.find(params[:user_id])
    authorize @user
  end

  def speaker_params
    params.require(:user).permit(:postcode, :travel_distance, :address, :cost)
  end

  def filtering_params(params)
    params.slice(:cost, :name, :category)
  end

end
