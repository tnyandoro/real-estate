class AddDetailsToTeachers < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :first_name, :string unless column_exists?(:teachers, :first_name)
    add_column :teachers, :last_name, :string unless column_exists?(:teachers, :last_name)
    add_column :teachers, :phone_number, :string unless column_exists?(:teachers, :phone_number)
    add_column :teachers, :address, :string unless column_exists?(:teachers, :address)
  end
end
