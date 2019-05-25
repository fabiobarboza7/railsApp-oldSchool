class ExchangesController < ApplicationController

	def index
		@exchanges = policy_scope(Exchange).order(created_at: :asc)
	end

	def new
		@user_score = current_user.score
    	@wallet = current_user.wallet
    	authorize current_user
	end

	def create
		@exchange = Exchange.new(exchange_params)
		authorize @exchange
		@exchange.user = current_user
		if(current_user.score >= @exchange.sale.rank_price)
			rank_exchange = current_user.score - @exchange.sale.rank_price
			current_user.update(score: rank_exchange)
			user_money = current_user.wallet.money + @exchange.sale.value
			current_user.wallet.update(money: user_money)
			flash[:notice] = "Você recebu m$#{@exchange.sale.value}!"

			@exchange.save!
		else	
			flash[:alert] = "Pontos insuficientes"
		end
		redirect_to user_wallet_path(current_user, current_user.wallet)
	end

	def exchange_params
    	params.require(:exchange).permit(:user_id, :title, :rank_price, :sale_id)
  	end
end
