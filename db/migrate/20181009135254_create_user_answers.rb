class CreateUserAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_answers do |t|
      t.references :question, foreign_key: true
      t.boolean :is_true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
