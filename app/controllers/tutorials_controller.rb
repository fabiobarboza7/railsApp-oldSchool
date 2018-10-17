class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :edit, :update, :destroy]

  def index
    @tutorials = policy_scope(Tutorial).order(course_id: :asc)
    @colors = ['background-color: #373F51;','background-color: #ECB5D3;','background-color: #008DD5;', 'background-color: #7BE0AD;', 'background-color: #31081F;', 'background-color: #8A716A;']
    @set_color = []
    @courses = Course.all
    @courses.each_with_index do |course, index|
      @set_color << {course_id: course.id, course_color: index}
    end
    @enrollments = current_user.enrollments
    authorize Lesson
  end

  def new
    @tutorial = Tutorial.new
    authorize @tutorial
  end

  def show
    @tutorials = policy_scope(Tutorial).order(created_at: :asc)
    # before_action
    authorize @tutorial

  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    authorize @tutorial
    @tutorial.save
    redirect_to dashboards_path
  end

  def edit

    @tutorial = Tutorial.find(params[:id])
    authorize @tutorial
    respond_to do |format|
      format.html { render 'lessons/edit' }
      format.js  # <-- idem
    end
  end

  def update
    # before_action
    @tutorial.update(tutorial_params)
    redirect_to root_path
  end

  def destroy
    # before_action
    @tutorial.destroy
    redirect_to root_path
  end


  private

  def set_tutorial
    @tutorial = Tutorial.find(params[:id])
  end

  def tutorial_params
    params.require(:tutorial).permit(:course_id, :title, :subtitle, :video, :file)
  end
end
