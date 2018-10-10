class Quiz < ApplicationRecord
  belongs_to :lesson
  has_many :questions, as: :questionable, dependent: :destroy
  has_many :user_answers, dependent: :destroy
  accepts_nested_attributes_for :questions
end
