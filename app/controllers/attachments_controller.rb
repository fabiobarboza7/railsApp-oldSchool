class AttachmentsController < ApplicationController
  before_action :set_file, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!

  def index
    @files = policy_scope(Attachment).order(created_at: :asc)
    authorize Attachment
  end

  def new
    @file = Attachment.new
    authorize @file
  end

  def show
    # before_action
    authorize @file
  end

  def create
    @file = Attachment.new(file_params)
    @file.user = current_user
    authorize @file
    if @file.save
      redirect_to course_subject_lessons_path(@file.subject.course.slug, @file.subject.slug)
      flash[:notice] = "Arquivo salvo com sucesso!"
    else
      redirect_to course_subject_lessons_path(@file.subject.course.slug, @file.subject.slug)
      flash[:alert] = "Erro, preencha todos os campos!"
      
    end
  end

  def update
    # before_action
    @file.update(file_params)
    authorize @file
    redirect_to root_path
  end

  def destroy
    # before_action
    @file.destroy
    authorize @file
    redirect_to root_path
  end


  private

  def set_file
    @file = Attachment.find(params[:id])
  end

  def file_params
    params.require(:attachment).permit(:title, :subject_id, :file)
  end

end
