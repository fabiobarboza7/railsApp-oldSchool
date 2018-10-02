class TransictionsController < ApplicationController
  before_action :set_transiction, only: [:show, :update, :destroy]

  def index

  end

  def new
    @transiction = Transiction.new
  end

  def show
    authorize @transiction
  end

  def create
    @transiction = Transiction.new(contact_params)
    if @transiction.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_transiction
    @transiction = Transiction.find(params[:id])
  end

  def transiction_params
    params.require(:transiction).permit(:title, :course_id)
  end

end
