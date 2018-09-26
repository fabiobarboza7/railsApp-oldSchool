class ChangeColumnAge < ActiveRecord::Migration[5.0]
  def up
    change_column :test_classes, :age, :string
  end

  def down
    change_column :test_classes, :age, :datetime
  end
end
