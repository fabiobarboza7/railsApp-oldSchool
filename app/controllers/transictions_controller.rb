class TransictionsController < ApplicationController
  before_action :set_transiction, only: [:show, :update, :destroy]

  def index

  end

  def new
    @transiction = Transiction.new
    authorize @transiction
  end

  def show
    authorize @transiction
  end

  def create
    @transiction = Transiction.new(transiction_params)
    @transiction.user = current_user
    authorize @transiction
    if @transiction.valid?
      if current_user.wallet.money < @transiction.amount
        redirect_to new_transiction_path
        flash[:alert] = "Saldo indisponível"
      else
        @transiction.save
        redirect_to user_wallet_path(current_user, current_user.wallet)
        flash[:notice] = "Transferência feita com sucesso"
      end
    else
      redirect_to new_transiction_path
      flash[:alert] = "Houve algum erro, tente novamente"
    end
  end

  private

  def set_transiction
    @transiction = Transiction.find(params[:id])
  end

  def transiction_params
    params.require(:transiction).permit(:user_id, :user_target, :amount)
  end

end
