class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :content
      t.string :duration
      t.integer :price

      t.timestamps
    end
  end
end
