class InvitePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    record.event.user == user
  end

  def accept?
    record.user == user
  end

  def negotiate?
    accept?
  end

  def reject?
    accept?
  end
end
