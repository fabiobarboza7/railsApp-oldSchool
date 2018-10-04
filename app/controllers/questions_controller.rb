class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :edit, :update, :destroy]

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
  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

  def set_question
    @lesson = Lesson.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :is_true, :score, :lesson_id, :done)
  end
end
