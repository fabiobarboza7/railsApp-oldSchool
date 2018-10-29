class AddCourseToTestClasses < ActiveRecord::Migration[5.0]
  def change
    add_reference :test_classes, :course, foreign_key: true
  end
end
