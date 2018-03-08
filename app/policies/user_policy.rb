class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(is_speaker: true)
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

  def edit?
    record == user
  end

  def update?
    record == user
  end

  def show?
    true
  end

  def ajax?
    true
  end

  def speaker_create?
    true
  end

  def speaker_show?
    true
  end

  def speaker_new?
    true
  end

  def speaker_index?
    true
  end

  def edit_speaker?
    true
  end
end
