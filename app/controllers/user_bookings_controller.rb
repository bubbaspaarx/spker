class UserBookingsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @bookings = policy_scope(UserBooking).where(user: @user)
    authorize @user
  end

  def create
    @booking = UserBooking.new
    @event = Event.find(params[:event_id])
    @booking.event = @event
    @booking.user = current_user
    authorize @booking
    @booking.save
    redirect_to user_user_bookings_path(current_user)
  end

  def destroy
    @booking = UserBooking.find(params[:id])
    @booking.destroy
    redirect_to user_user_bookings_path(current_user)
  end
end
