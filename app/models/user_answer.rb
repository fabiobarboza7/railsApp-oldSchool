class UserAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :test, optional: true
  belongs_to :quiz, optional: true
  before_save :set_done

  def set_done
    if self.question.is_true?
      self.is_true = true
      # self.question.questionable.update(done: true)
    else
      self.is_true = false
      # self.question.questionable.update(done: false)
    end
  end

end
