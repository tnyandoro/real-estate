class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.binary :face_image
      t.string :identification
      t.date :date_of_birth
      t.string :region
      t.string :program

      t.timestamps
    end
  end
end
