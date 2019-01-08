class InvitesController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_invite, only: [:accept, :reject, :negotiate]

  def create
    @invite = Invite.new(status: 'pending')
    @invite.event = Event.find(invite_params[:events])
    @invite.user = @user
    @invite.fee = @user.cost
    authorize @invite
    if @invite.save
      message = Message.new(content: "You have received an invite to #{@invite.event.name} from #{ @invite.event.user.first_name } #{@invite.event.user.last_name}")
      message.sender = current_user
      message.receiver = @user
      message.save
      redirect_to inbox_users_path(current_user, @user)
    end
  end

  def accept
    authorize @invite
    @invite.update(status: 'accepted')
    message = Message.new(content: "Your invite to #{ @invite.user.first_name } #{@invite.user.last_name} for #{@invite.event.name} has been accepted")
    message.sender = @invite.user
    message.receiver = @invite.event.user
    message.save
    redirect_to dashboard_path(current_user)
  end

  def negotiate
    authorize @invite
    raise
  end

  def reject
    authorize @invite
    @invite.update(status: 'rejected')
    message = Message.new(content: "Your invite to #{ @invite.user.first_name } #{@invite.user.last_name} for #{@invite.event.name} has been rejected")
    message.sender = @invite.user
    message.receiver = @invite.event.user
    message.save
    redirect_to dashboard_path(current_user)
  end

  private

  def invite_params
    params.require(:user).permit(:events)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_invite
    @invite = Invite.find(params[:id])
  end
end
