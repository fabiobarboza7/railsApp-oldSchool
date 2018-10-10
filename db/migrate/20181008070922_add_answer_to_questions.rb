class AddAnswerToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :answer, :boolean
  end
end
