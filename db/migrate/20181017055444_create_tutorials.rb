class CreateTutorials < ActiveRecord::Migration[5.0]
  def change
    create_table :tutorials do |t|
      t.references :course, foreign_key: true
      t.string :title
      t.string :subtitle
      t.string :video
      t.string :file

      t.timestamps
    end
  end
end
