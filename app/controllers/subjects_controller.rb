class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :update, :destroy]

  def index

    @subjects = policy_scope(Subject).where(course_id: params[:course_id]).order(created_at: :asc)
    @enrollments = current_user.enrollments
    @course = Course.friendly.find(params[:course_id])
    @subject = Subject.new
    # @subject.course = @course
    authorize Subject
  end

  def new
  end

  def show
    # before_action
    authorize @subject
    respond_to do |format|
      format.html { render 'subjects/show' }
      format.js  # <-- idem
    end
  end

  def create
    @enrollments = current_user.enrollments
    @subjects = policy_scope(Subject).where(course_id: params[:course_id]).order(created_at: :asc)
    @course = Course.friendly.find(params[:course_id])
    @subject = Subject.new(subject_params)
    authorize @subject
    @subject.course_id = @course.id
    respond_to do |format|
      if @subject.save
        format.js  # renders create.js.erb, which could be used to redirect via javascript
      else
        redirect_to dashboards_path
      end
    end
  end

  def update
    # before_action
    @subject.update(subject_params)
    authorize @subject
    render "subjects/index"
  end

  def destroy
    # before_action
    @subject.destroy
    redirect_to root_path
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:title, :course_id)
  end

end
