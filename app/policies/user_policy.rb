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

  def speaker_create?
    true
  end

  def speaker_show?
    true
  end

  def speaker_index?
    true
  end

  def edit_speaker?
    true
  end
end
