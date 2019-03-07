class TestClassesController < ApplicationController
  before_action :set_test_class, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  def new
    @test_class = TestClass.new
    authorize @test_class
  end

  def show
    # before_action
    authorize @test_class
  end

  def create
    @test_class = TestClass.new(test_class_params)
    authorize @test_class
    if @test_class.valid?
      if @test_class.save!
        redirect_to root_path
        flash[:notice] = "Aula Teste agendada com sucesso"
      else 
        redirect_to aula_gratis_path
        flash[:alert] = "Houve um erro, verifique todos os campos!"
      end
    else  
      redirect_to aula_gratis_path
      flash[:alert] = "Houve um erro, verifique todos os campos!"
    end

  end

  def update
    # before_action
    @test_class.update(test_class_params)
    authorize @test_class
    redirect_to root_path
  end

  def destroy
    # before_action
    @test_class.destroy
    authorize @test_class
    redirect_to root_path
  end

  private

  def set_test_class
    @test_class = TestClassfind(params[:id])
  end

  def test_class_params
    params.require(:test_class).permit(:student, :age, :parent, :email, :phone, :schedule, :course_id)
  end
end
