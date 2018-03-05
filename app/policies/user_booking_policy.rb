class UserBookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
