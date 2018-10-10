class Question < ApplicationRecord
  belongs_to :questionable, polymorphic: true, optional: true
  has_many :user_answers, dependent: :destroy
  before_save :set_score

  def set_score
    if self.is_true?
      self.score = 10
    else
      self.score = 0
    end
  end
end
