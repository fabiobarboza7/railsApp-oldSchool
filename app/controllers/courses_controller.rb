class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_course, only: [:show, :update, :destroy]

  def new
    @course = Course.new
    authorize @course
  end

  def show
    @contact = Contact.new
    # before_action
    if !user_signed_in?
      skip_authorization
    else
      authorize @course
    end
    respond_to do |format|
      format.html { render 'courses/show' }
      format.js  # <-- idem
    end
  end

  def create
    @course = Course.new(course_params)
    authorize @course
    @course.save
    redirect_to root_path
  end

  def update
    # before_action
    @course.update(course_params)
    redirect_to root_path
  end

  def destroy
    # before_action
    @course.destroy
    redirect_to root_path
  end


  private

  def set_course
    @course = Course.friendly.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :content, :duration, :price, :photo, :photo_cache)
  end
end
