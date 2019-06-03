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
      @user_best = @users.first
      @user_second = @users[1...2]
      @user_third = @users[2...3]
      @user_fourth = @users[3...4]

      if @user_best.score == @user_second.first.score
        @user_second = @users[2...3]
      end

      if @user_second.first.score == @user_third.first.score
        @user_third = @users[3...4]
      end

      if @user_third.first.score == @user_fourth.first.score
        @user_fourth = @users[4...5]
      end

      @quizzes = Quiz.all
      @files = Attachment.where(user: current_user)
      @enroll = Enrollment.where(user: current_user.id)
    end
  end


end
