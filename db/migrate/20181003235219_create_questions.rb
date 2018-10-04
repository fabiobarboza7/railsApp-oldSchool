class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.boolean :is_true
      t.integer :score
      t.references :questionable, polymorphic: true

      t.timestamps
    end
  end
end
