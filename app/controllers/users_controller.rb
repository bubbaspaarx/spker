class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard, :show]
  before_action :authorize_user, only: [:dashboard, :show]

  def dashboard
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
