class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize_event, except: [:index, :new]

  def index
    @events = Event.all
    authorize @events
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @event = Event.new
    authorize @event

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def authorize_event
    authorize @event
  end

end
