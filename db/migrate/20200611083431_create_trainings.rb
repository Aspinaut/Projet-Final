class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.string :name
      t.string :duration
      t.string :description
      t.float :hoursPerDay
      t.string :url
      t.string :mode
      t.boolean :help_for_a_job
      t.belongs_to :school, index: true
      t.timestamps
    end
  end
end
