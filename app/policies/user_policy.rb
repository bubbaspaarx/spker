class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def dashboard?
    record == user
  end

  def index?
    true
  end

  def show?
    true
  end
end
