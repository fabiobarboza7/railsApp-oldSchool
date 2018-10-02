class Wallet < ApplicationRecord
  belongs_to :user
  before_save :set_money

  def set_money
    if self.money == 0 or self.money.nil?
      self.money = 0
    end
  end
end
