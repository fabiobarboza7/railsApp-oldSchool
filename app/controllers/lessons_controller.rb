class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  def index
    @subject = Subject.friendly.find(params[:subject_id])
    # @lessons = policy_scope(Lesson).friendly.where(subject_id: params[:subject_id]).order(created_at: :asc)
    @lessons = policy_scope(Lesson).where(subject_id: @subject)
    @lesson = Lesson.new
    @file = Attachment.new
    @files = Attachment.where(subject_id: @subject, user: current_user)
    # @file.subject = @subject
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
    @user_answer = UserAnswer.new
    @quiz = Quiz.new
    @quizzes = @lesson.quizzes
    @count = 0
    @quizzes.each do |quiz|
      if !quiz.user_answers.where(user: current_user).any?
        @count = @count + 1
      end
    end

    @question = @quiz.questions.build
    @quiz.lesson_id = @lesson
    authorize @lesson

  end

  def create
    @subject = Subject.friendly.find(params[:subject_id])
    @lesson = Lesson.new(lesson_params)
    authorize @lesson
    @lesson.subject_id = @subject.id
    if @lesson.save!
       redirect_to course_subject_lessons_path(@lesson.subject.course.id, @lesson.subject.id)
      flash[:notice] = "Aula salva com sucesso"
    else
      redirect_to dashboards_path
    end

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
    authorize @lesson
    @lesson.update(lesson_params)
    flash[:notice] = "Lição atualizada com sucesso"

    redirect_to :back
  end

  def destroy
    # before_action
    @lesson.destroy
    redirect_to root_path
  end


  private

  def set_lesson
    @lesson = Lesson.friendly.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video, :file, :subject_id)
  end

end
