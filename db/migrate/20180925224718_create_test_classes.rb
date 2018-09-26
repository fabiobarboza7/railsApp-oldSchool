class CreateTestClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :test_classes do |t|
      t.string :student
      t.datetime :age
      t.string :parent
      t.string :email
      t.string :phone
      t.string :schedule

      t.timestamps
    end
  end
end
