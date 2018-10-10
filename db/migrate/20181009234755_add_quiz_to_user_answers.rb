class AddQuizToUserAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_answers, :quiz, foreign_key: true
  end
end
