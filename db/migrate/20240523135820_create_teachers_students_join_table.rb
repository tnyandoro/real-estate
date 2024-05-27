class CreateTeachersStudentsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :teachers, :students do |t|
      t.references :teachers, null: false, foreign_key: true
      t.references :students, null: false, foreign_key: true
    end
  end
end
