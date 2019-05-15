class ClassroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
  	user.admin?
  end

  def new?
  	user.admin?
  end

  def show?
    create?
  end

  def edit?
    create?
  end

  def update?
    edit?
  end

  def create?
  	new?
  end
end
