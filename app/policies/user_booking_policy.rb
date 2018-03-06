class UserBookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    record.first.user == user
  end

  def create?
    record.event.user != user
  end

  def destroy?
    record.user == user
  end
end
