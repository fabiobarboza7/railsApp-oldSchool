class DepositsController < ApplicationController

	def index
		@deposits = policy_scope(Deposit).order(created_at: :desc)
		authorize Deposit
	end

	def new
		@deposit = Deposit.new
		authorize @deposit
	end

	def create
		@deposit = Deposit.new(deposit_params)
		authorize @deposit
		if @deposit.save
			update_money = @deposit.amount + @deposit.user.wallet.money
			@deposit.user.wallet.update(money: update_money)
			flash[:notice] = "Deposito feito com sucesso"
			redirect_to dashboards_path
		else
			flash[:alert] = "Erro, tente novamente"
			redirect_to new_deposit_path
		end	
	end

	def update
	end

	def deposit_params
    	params.require(:deposit).permit(:user_id, :amount)
  	end
end

