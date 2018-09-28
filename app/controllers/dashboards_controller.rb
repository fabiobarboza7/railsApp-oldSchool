class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @courses = Course.all
    @dashboards = policy_scope(Dashboard).order(created_at: :desc)
  end

end
