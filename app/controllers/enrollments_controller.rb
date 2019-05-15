class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  def index
    @enrollments = policy_scope(Enrollment).order(created_at: :asc)
    authorize Enrollment
    @enrollment = Enrollment.new
  end

  def new
    @enrollments = current_user.enrollments
    @enrollment = Enrollment.new
    authorize @enrollment
  end

  def show
    # before_action
    authorize @enrollment
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    authorize @enrollment
    if @enrollment.save!
      flash[:notice] = "Matricula criada com sucesso"
    else  
      @enrollment.errors.full_messages.each do |message|
        full_msg = message.split
        full_msg = full_msg.drop(1).join(" ")
        flash[:alert] = full_msg
      end 
      
    end
    redirect_to dashboards_path    
  end

  def edit

    @enrollment = Enrollment.find(params[:id])
    authorize @enrollment
    respond_to do |format|
      format.html { render 'lessons/edit' }
      format.js  # <-- idem
    end
  end

  def update
    # before_action
    @enrollment.update(enrollment_params)
    redirect_to root_path
  end

  def destroy
    # before_action
    @enrollment.destroy
    redirect_to root_path
  end


  private

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:course_id, :user_id, :classroom_id)
  end
end
