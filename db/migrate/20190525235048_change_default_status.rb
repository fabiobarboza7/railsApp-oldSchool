class ChangeDefaultStatus < ActiveRecord::Migration[5.0]
  def change
  	change_column :exchanges, :status, :boolean, :default => false
  end
end
