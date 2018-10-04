class AddIsVerifiedToWallet < ActiveRecord::Migration[5.0]
  def change
    add_column :wallets, :is_verified, :boolean, :default => false
  end
end
