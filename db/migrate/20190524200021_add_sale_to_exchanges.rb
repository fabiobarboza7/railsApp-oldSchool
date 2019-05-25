class AddSaleToExchanges < ActiveRecord::Migration[5.0]
  def change
    add_reference :exchanges, :sale, foreign_key: true
  end
end
