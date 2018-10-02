class AddIsFreeToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :is_free, :boolean
  end
end
