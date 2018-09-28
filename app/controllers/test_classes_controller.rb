class TestClassesController < ApplicationController
  before_action :set_test_class, only: [:show, :update, :destroy]

  def new
    @test_class = TestClass.new
    authorize @test_class
  end

  def show
    # before_action
  end

  def create
    @test_class = TestClass.new(test_class_params)
    if @test_class.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    # before_action
    @test_class.update(test_class_params)
    redirect_to root_path
  end

  def destroy
    # before_action
    @test_class.destroy
    redirect_to root_path
  end


  private

  def set_test_class
    @test_class = TestClassfind(params[:id])
  end

  def test_class_params
    params.require(:test_class).permit(:student, :age, :parent, :email, :phone, :schedule)
  end
end
