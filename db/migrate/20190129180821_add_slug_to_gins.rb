class AddSlugToGins < ActiveRecord::Migration[5.2]
  def change
    add_column :gins, :slug, :string
  end
end
