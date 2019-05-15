class AddClassroomToEnrollments < ActiveRecord::Migration[5.0]
  def change
    add_reference :enrollments, :classroom, foreign_key: true
  end
end
