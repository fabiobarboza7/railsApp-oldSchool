class AddStatusToExchanges < ActiveRecord::Migration[5.0]
  def change
    add_column :exchanges, :status, :boolean
  end
end
