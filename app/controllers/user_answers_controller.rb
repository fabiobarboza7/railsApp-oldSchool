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
    authorize @user_answer
    if @user_answer.save
      redirect_to course_subject_lessons_path(@user_answer.quiz.lesson.subject.course, @user_answer.quiz.lesson.subject)
      if @user_answer.is_true?
        flash[:notice] = "Parabéns #{@user_answer.user.first_name}, você acertou! :)"
      else
        flash[:alert] = "Não foi dessa vez :("
      end
    end
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
