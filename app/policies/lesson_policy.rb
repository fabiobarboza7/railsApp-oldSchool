class LessonPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    show?
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

end
