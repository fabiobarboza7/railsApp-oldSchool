class ChangeStringToBeInteger < ActiveRecord::Migration[5.0]
	def change
		rename_column :sales, :title, :value
	end
end
