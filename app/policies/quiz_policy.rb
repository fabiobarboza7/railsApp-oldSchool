class QuizPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    show?
  end

  def show? 
    enroll = Enrollment.where(user: user.id)
    if enroll.nil? == false
      record.each do |rec|
        if rec.lesson.subject.course_id == enroll.last.course_id
          true
          puts "true ==============="
        else
          false
          puts "false ==============="
        end
      end
    else
      false
    end

  end

  def new?
    create?
  end

  def create?
    user.admin?
  end

  def update?
    create?
  end

end
