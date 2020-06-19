class AddUserForeignKeyToSchools < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :schools, :users
  end
end
