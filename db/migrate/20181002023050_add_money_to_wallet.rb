class AddMoneyToWallet < ActiveRecord::Migration[5.0]
  def change
    add_column :wallets, :money, :integer
  end
end
