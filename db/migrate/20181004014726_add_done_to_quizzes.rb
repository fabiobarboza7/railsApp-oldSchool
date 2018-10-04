class AddDoneToQuizzes < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :done, :boolean
  end
end
