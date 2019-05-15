class Classroom < ApplicationRecord
  has_many :enrollments
  validates :enrollment_ids, presence: true, uniqueness: {scope: :enrollment_id, message: "usuário já matriculado"}
end
