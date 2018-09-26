class TestClassesController < ApplicationController
  before_action :set_test_class, only: [:show, :update, :destroy]

  def new
    @test_class = TestClass.new
  end

  def show
    # before_action
  end

  def create
    @test_class = TestClass.new(course_params)
    if @test_class.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    # before_action
    @test_class.update(course_params)
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

  def course_params
    params.require(:test_class).permit(:student, :age, :parent, :email, :phone, :schedule)
  end
end
