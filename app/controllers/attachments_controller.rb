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
    authorize @file
    if @file.save
      flash[:notice] = "Post criado com sucesso"
    else
      render :new
    end
    redirect_to root_path
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
    @file = Attachment.friendly.find(params[:id])
  end

  def file_params
    params.require(:file).permit(:title, :subject_id, :file)
  end

end
