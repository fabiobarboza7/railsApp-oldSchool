class EnrollmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    show?
  end

  def show?
    new?
    # user.enrollments.where(course_id: record.course_id).exists?
  end

  def new?
    create?
  end

  def edit?
    create?
  end

  def create?
    user.admin?
  end

  def update?
    create?
  end

end
