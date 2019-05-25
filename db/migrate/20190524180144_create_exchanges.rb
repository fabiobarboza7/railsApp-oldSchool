class CreateExchanges < ActiveRecord::Migration[5.0]
  def change
    create_table :exchanges do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.integer :rank_price

      t.timestamps
    end
  end
end
