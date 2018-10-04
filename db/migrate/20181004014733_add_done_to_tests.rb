class AddDoneToTests < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :done, :boolean
  end
end
