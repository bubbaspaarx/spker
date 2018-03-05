class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard, :show]
  before_action :authorize_user, only: [:dashboard, :show]

  def dashboard
  end

  def index
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    authorize @user
  end

end
