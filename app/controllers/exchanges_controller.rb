class ExchangesController < ApplicationController

	def index
		@exchanges = policy_scope(Exchange).order(created_at: :desc)
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

	def update
		@exchange = Exchange.find(params[:id])
		authorize @exchange
		if @exchange.status != true
			less_money = current_user.wallet.money - @exchange.sale.value
			@exchange.update(status: true)
			current_user.wallet.update(money: less_money)
			flash[:notice] = "Você pagou o #{@exchange.user.first_name}"	
		else
			more_money = current_user.wallet.money + @exchange.sale.value
			@exchange.update(status: false)
			current_user.wallet.update(money: more_money)
			flash[:alert] = "Você cancelou o #{@exchange.user.first_name}"	
		end
		redirect_to exchanges_path
	end

	def exchange_params
    	params.require(:exchange).permit(:user_id, :title, :rank_price, :sale_id, :status)
  	end
end
