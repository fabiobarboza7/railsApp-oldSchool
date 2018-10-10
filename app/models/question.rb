class Question < ApplicationRecord
  belongs_to :questionable, polymorphic: true, optional: true
  has_many :user_answers, dependent: :destroy
end
