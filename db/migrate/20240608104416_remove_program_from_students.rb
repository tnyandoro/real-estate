class RemoveProgramFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :program, :string
  end
end
