class ActivityPolicy < ApplicationPolicy

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def my_activities?
    true
  end

  def toggle_favorite?
    true
  end

  def edit?
    user == record.user
  end

  def update?
    user == record.user
  end
end
