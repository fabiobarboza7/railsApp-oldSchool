class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :classroom, optional: true
  validates :course_id, presence: true, uniqueness: {scope: :user_id, message: "usuário já matriculado"}

  def user_name
  	self.user.first_name + " " + self.user.last_name
  end

end
