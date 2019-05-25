class ChangeValueToBeIntegerInSales < ActiveRecord::Migration[5.0]
  def change
  	change_column :sales, :value, :integer, using: 'value::integer'
  end
end
