class AddBackgroundImgToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :background_img, :string
  end
end
