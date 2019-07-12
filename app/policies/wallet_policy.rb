class WalletPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
  	# user.wallet.is_verified?
    record.user = user
  end

end
