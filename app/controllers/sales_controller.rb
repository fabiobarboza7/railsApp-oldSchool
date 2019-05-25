class SalesController < ApplicationController
	def index
		@sales = policy_scope(Sale).order(created_at: :asc)
		authorize Sale
    	@wallet = current_user.wallet
	end

	def new
		@user_score = current_user.score
    	@wallet = current_user.wallet
    	authorize current_user
	end

	def create
		@exchange = Sale.new(sale_params)
	end

	def sale_params
    	params.require(:sale).permit(:title, :rank_price)
  	end
end

