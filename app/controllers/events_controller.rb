class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]
  before_action :authorize_event, except: [:index, :new, :create]

  def index
    @events = Event.all
    authorize @events
  end

  def show
  end

  def new
    @event = Event.new
    authorize_event

  end

  def create
    @event = Event.new(event_params)
    authorize_event
    @event.user = @user
    if @event.save!
      redirect_to event_path(@event)
    else
      render :new
    end
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

  def set_user
    @user = User.find(params[:user_id])
  end

  def authorize_event
    authorize @event
  end

  def event_params
    params.require(:event).permit(:name, :address, :postcode, :date, :start_time, :end_time)
  end
end
