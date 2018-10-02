class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @lessons = policy_scope(Lesson).where(subject_id: params[:subject_id]).order(created_at: :asc)
    @subject = Subject.find_by_id(params[:subject_id])
    @lesson = Lesson.new
    @lesson.subject = @subject
    authorize Lesson
  end

  def new
    @subject = Subject.find_by_id(params[:subject_id])
    @lesson = Lesson.new
    @lesson.subject_id = @subject.id
    authorize @lesson
    respond_to do |format|
      format.html { render 'lessons/new' }
      format.js  # <-- idem
    end
  end

  def show
    @lessons = policy_scope(Lesson).where(subject_id: params[:subject_id]).order(created_at: :asc)
    # before_action
    authorize @lesson
  end

  def create
    @subject = Subject.find_by_id(params[:subject_id])
    @lesson = Lesson.new(lesson_params)
    authorize @lesson
    @lesson.subject_id = @subject.id
    @lesson.save
    redirect_to dashboards_path
  end

  def edit
    @subject = Subject.find_by_id(params[:subject_id])
    @lesson = Lesson.find(params[:id])
    authorize @lesson
    respond_to do |format|
      format.html { render 'lessons/edit' }
      format.js  # <-- idem
    end
  end

  def update
    # before_action
    @lesson.update(lesson_params)
    redirect_to root_path
  end

  def destroy
    # before_action
    @lesson.destroy
    redirect_to root_path
  end


  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video, :file, :subject_id)
  end

end
