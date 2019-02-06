class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :course_id, presence: true, uniqueness: {message: "usuário já matriculado"}
end
