class DashboardsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @enrollments = current_user.enrollments
    @dashboards = policy_scope(Dashboard).order(created_at: :desc)
    @users = User.all.order(score: :desc)
    @quizzes = Quiz.all
  end

end
