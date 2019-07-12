class DashboardsController < ApplicationController

  before_action :authenticate_user!

  def index
    @dashboards = policy_scope(Dashboard).order(created_at: :desc)
    @course_adult = Course.find(3)
    if current_user.is_adult? === true
      redirect_to course_subject_lessons_path(@course_adult, @course_adult.subjects.first)
    else
      @user = current_user
      @enrollments = current_user.enrollments
      @users = User.all.order(score: :desc)
      
      @quizzes = Quiz.all
      @files = Attachment.where(user: current_user)
      @enroll = Enrollment.where(user: current_user.id)
    end
  end


end
