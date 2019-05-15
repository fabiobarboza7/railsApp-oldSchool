class ClassroomsController < ApplicationController
  def index
  	@classrooms = policy_scope(Classroom).order(created_at: :asc)
  	authorize Classroom
  end

  def new
  	@classroom = Classroom.new
  	authorize @classroom
  end

  def show
    @classroom = Classroom.find(params[:id])
    authorize @classroom
  end

  def edit
    @classroom = Classroom.find(params[:id])
    authorize @classroom
  end

  def update
    @classroom = Classroom.find(params[:id])
    @classroom.enrollment_ids = params[:classroom][:enrollment_ids]
    byebug
    # byebug
    authorize @classroom
    if @classroom.save!
      flash[:notice] = "Aluno adicionado com sucesso"
      redirect_to classrooms_path
    else  
      flash[:alert] = "Erro"
      redirect_to new_classroom_path
    end
  end

  def create
  	@classroom = Classroom.create(classroom_params)
  	authorize @classroom
  	if @classroom.save!
  		redirect_to classrooms_path
  	else	
  		redirect_to new_classroom_path
  	end
  end

  private

  def classroom_params
  	params.require(:classroom).permit(:title, :enrollment_ids)
  end

end
