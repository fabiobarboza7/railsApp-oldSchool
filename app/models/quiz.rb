class Quiz < ApplicationRecord
  belongs_to :lesson
  has_many :questions, as: :questionable
  # accepts_nested_attributes_for :questions
end
