class SubjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    user.enrollments.where(course_id: record.course_id).exists?
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
