class AddTeacherIdToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :teacher_id, :integer
  end
end
