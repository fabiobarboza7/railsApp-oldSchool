class AddIsAdultToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_adult, :boolean
  end
end
