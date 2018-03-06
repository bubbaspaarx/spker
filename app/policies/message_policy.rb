class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where("sender_id = ? OR receiver_id = ?", user.id, user.id)
    end
  end

  def index?
    record == user
  end

  def create?
    true
  end
end
