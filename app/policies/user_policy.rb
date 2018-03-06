class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def inbox?
    record == user
  end

  def conversation?
    inbox?
  end

  def dashboard?
    record == user
  end

  def index?
    record == user
  end

  def show?
    true
  end
end
