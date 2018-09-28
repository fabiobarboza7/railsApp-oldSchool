class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :subtitle
      t.string :video
      t.string :file
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
