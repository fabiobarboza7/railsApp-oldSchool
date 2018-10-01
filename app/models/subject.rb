class Subject < ApplicationRecord
  has_many :lessons
  belongs_to :course

end
