class CoursesController < ApplicationController

  before_action :set_course, only: [:show, :update, :destroy]

  def new
    @course = Course.new
  end

  def show
    # before_action
    authorize @course
    respond_to do |format|
      format.html { render 'courses/show' }
      format.js  # <-- idem
    end
  end

  def create
    @course = Course.new(course_params)
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
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :content, :duration, :price, :photo, :photo_cache)
  end
end
