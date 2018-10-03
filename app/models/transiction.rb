class Transiction < ApplicationRecord
  belongs_to :user
  # belongs_to :user_target, foreign_key: 'user_target', primary_key: 'code'
  after_create :transfer_money
  after_create :decrease_money
  validates :user_target, :amount, presence: true


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
