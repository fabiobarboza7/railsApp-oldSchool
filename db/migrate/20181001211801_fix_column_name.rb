class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :age, :date_of_birth
  end
end
