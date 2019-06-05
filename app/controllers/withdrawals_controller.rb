class WithdrawalsController < ApplicationController

	def index
		@withdrawals = policy_scope(Withdrawal).order(created_at: :desc)
		authorize Withdrawal
	end

	def new
		@withdrawal = Withdrawal.new
		authorize @withdrawal
	end

	def create
		@withdrawal = Withdrawal.new(withdrawal_params)
		authorize @withdrawal
		if @withdrawal.amount < @withdrawal.user.wallet.money
			if @withdrawal.save
				update_money = @withdrawal.user.wallet.money - @withdrawal.amount
				@withdrawal.user.wallet.update(money: update_money)
				flash[:notice] = "Saque feito com sucesso"
				redirect_to dashboards_path
			else
				flash[:alert] = "Erro, tente novamente"
				redirect_to new_withdrawal_path
			end	
		else
			flash[:alert] = "Saldo insuficiente"
			redirect_to new_withdrawal_path
		end
	end

	def update
	end

	def withdrawal_params
    	params.require(:withdrawal).permit(:user_id, :amount)
  	end
end

