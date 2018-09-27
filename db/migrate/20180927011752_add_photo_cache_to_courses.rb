class AddPhotoCacheToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :photo_cache, :string
  end
end
