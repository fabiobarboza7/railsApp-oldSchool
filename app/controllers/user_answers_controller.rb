class UserAnswersController < ApplicationController
  before_action :set_user_answer, only: [:show, :edit, :destroy]

  def index

  end

  def new

  end

  def show

  end

  def create
    @user_answer = UserAnswer.new(user_answer_params)
    @user_answer.user = current_user
    @user_answer.quiz = @user_answer.question.questionable
    @user_answer.save!
    authorize @user_answer
  end

  def edit
    authorize @user_answer
  end

  def update
    @user_answer.update(user_answer_params)
    authorize @user_answer
  end

  def destroy
    authorize @user_answer
  end


  private

  def set_user_answer
    @lesson = Lesson.find(params[:id])
  end

  def user_answer_params
    params.require(:user_answer).permit(:question_id, :is_true, :user_id, :test_id, :quiz_id)
  end
end
