class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]
  before_action :authorize_event, except: [:index, :new, :create, :update]

  def index
    if params[:location].nil? || params[:location] == ""
      @events = policy_scope(Event)
      authorize @events
      redirect_to root_path
    else
      @events = policy_scope(Event).near(params[:location], 10)
      filtering_params(params).each do |key, value|
        @events = @events.public_send(key, value) if value.present?
      end
      @markers = @events.map do |event| {
        lat: space.latitude,
        lng: space.longitude
      }
      end
    end
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
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to dashboard_path(current_user)
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
    params.require(:event).permit(:name, :address, :postcode, :date, :cost, :start_time, :end_time, :photo)
  end

  def filtering_params(params)
    params.slice(:address, :postcode, :date)
  end

end
