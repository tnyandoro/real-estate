class RenameTitleToNameInCourses < ActiveRecord::Migration[7.0]
  def change
    rename_column :courses, :title, :name
  end
end
