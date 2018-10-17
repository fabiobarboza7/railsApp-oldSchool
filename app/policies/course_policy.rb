class CoursePolicy < ApplicationPolicy
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
    # user.enrollments.where(course_id: record).exists?
  end

  def new?
    create?
  end

  def create?
    user.admin?
  end

end
