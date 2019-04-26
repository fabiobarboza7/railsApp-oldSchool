class UsersController < ApplicationController

  def index
    @users = policy_scope(User).order(created_at: :asc)
    authorize User
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save!
      redirect_to dashboards_path
    else
      flash[:alert] = "Tente novamente..."
      redirect_to new_user_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :date_of_birth, :photo, :photo_cache, :password, :password_confirmation)
  end

end
