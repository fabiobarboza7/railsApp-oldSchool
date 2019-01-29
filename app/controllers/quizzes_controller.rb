class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :destroy]

  def index
    @quizzes = policy_scope(Quiz).order(created_at: :asc)
    authorize Quiz
  end

  def new
    @quiz = Quiz.new
    authorize @quiz

    # @quiz.lesson_id = @lesson

    # authorize @quiz
    # respond_to do |format|
    #   format.html { render 'lessons/new' }
    #   format.js  # <-- idem
    # end
  end

  def show

  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @quiz = Quiz.new(quiz_params)
    @quiz.lesson_id = @lesson.id
    @question = @quiz.questions.first
    authorize @quiz
    if @quiz.save!
      redirect_to course_subject_lessons_path(@quiz.lesson.subject.course, @quiz.lesson.subject)
    else
      redirect_to course_subject_lessons_path(@quiz.lesson.subject.course, @quiz.lesson.subject)
    end
  end

  def edit

  end

  def update
    @quiz = Quiz.find(params[:id])
    byebug
    @update_question = @quiz.questions.find(params[:quiz][:questions_attributes]["0"][:id])
    if @quiz.questions.find(params[:quiz][:questions_attributes]["0"][:answer]) == "1"
      @update_question.answer == true
    end

    # byebug
    # @question = @quiz.questions.find(params[:quiz][:questions_attributes]["0"][:id])
    # byebug
    @question.save!
    byebug
    authorize @quiz
    redirect_to dashboards_path
  end

  def destroy

  end


  private

  def set_quiz
    @lesson = Lesson.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :score, :lesson_id, :done, :questions_attributes => [:title, :is_true, :score, :lesson_id, :answer, :id])
  end

end
