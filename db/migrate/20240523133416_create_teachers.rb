class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :course
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
