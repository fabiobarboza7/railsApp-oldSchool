class Transiction < ApplicationRecord
  belongs_to :user
  after_create :transfer_money
  after_create :decrease_money


  private

  def decrease_money
    user_wallet = self.user.wallet
    user_wallet.money = user_wallet.money - self.amount
    user_wallet.save!
  end

  def transfer_money
    target_wallet = User.find(self.user_target).wallet
    target_wallet.money = target_wallet.money + self.amount
    target_wallet.save!
  end

end
