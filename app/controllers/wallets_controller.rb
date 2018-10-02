class WalletsController < ApplicationController
  before_action :set_wallet, only: [:show, :update, :destroy]

  def show
    @courses = Course.all
    authorize @wallet
  end

  private

  def set_wallet
    @wallet = Wallet.find(params[:id])
  end

  def wallet_params
    params.require(:wallet).permit(:title, :course_id)
  end

end
