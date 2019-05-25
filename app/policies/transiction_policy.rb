class TransictionPolicy < ApplicationPolicy
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
    true
  end

  def update?
    true
  end

end
