class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :website
      t.integer :creation_year
      t.integer :campus_nb
      t.string :siret
      t.timestamps
    end
  end
end
