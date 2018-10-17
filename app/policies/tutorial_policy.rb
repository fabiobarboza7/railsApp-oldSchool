class TutorialPolicy < ApplicationPolicy
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
    # user.enrollments.where(course_id: record.course_id).exists?
  end

  def new?
    create?
  end

  def create?
    user.admin?
  end

  def update?
    true
  end

end
