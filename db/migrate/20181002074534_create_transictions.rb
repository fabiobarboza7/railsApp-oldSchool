class CreateTransictions < ActiveRecord::Migration[5.0]
  def change
    create_table :transictions do |t|
      t.references :user, foreign_key: true
      t.integer :user_target
      t.decimal :amount

      t.timestamps
    end
  end
end
