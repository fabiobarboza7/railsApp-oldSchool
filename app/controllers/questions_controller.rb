class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :destroy]

  def index

  end

  def new

  end

  def show

  end

  def create
    # @lesson = Lesson.find(params[:lesson_id])
    # @quiz = Quiz.new(question_params)
    # @quiz.lesson_id = @lesson
    # @quiz.save!
    authorize @question
  end

  def edit
    authorize @question
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    authorize @question
  end

  def destroy
    authorize @question
  end


  private

  def set_question
    @lesson = Lesson.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :is_true, :score, :lesson_id, :done, :answer)
  end
end
