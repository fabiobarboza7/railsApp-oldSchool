class AddTestToUserAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_answers, :test, foreign_key: true
  end
end
