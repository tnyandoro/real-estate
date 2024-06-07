class AddDetailsToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :name, :string
    add_column :students, :phone_number, :string
    add_column :students, :address, :string
  end
end
