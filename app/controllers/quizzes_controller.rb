class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @lesson = Lesson.find_by_id(params[:subject_id])
    @quiz = Quiz.new
    @quiz.lesson_id = @lesson
    authorize @lesson
    respond_to do |format|
      format.html { render 'lessons/new' }
      format.js  # <-- idem
    end
  end

  def show

  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @quiz = Quiz.new(quiz_params)
    @question = Question.new

    @quiz.lesson_id = @lesson
    authorize @quiz
    byebug
    @quiz.save

  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

  def set_quiz
    @lesson = Lesson.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :score, :lesson_id, :done, :questions_attributes => [:title, :is_true, :score, :lesson_id, :done])
  end

end
