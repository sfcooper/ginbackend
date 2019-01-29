class ChangeTitleToNameInGins < ActiveRecord::Migration[5.2]
  def change
    rename_column :gins, :title, :gin_name
  end
end
