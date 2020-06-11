class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.decimal :price
      t.belongs_to :training, index: true
      t.timestamps
    end
  end
end
