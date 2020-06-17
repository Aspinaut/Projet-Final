class AddLogoUrlToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :logo_url, :string
  end
end
