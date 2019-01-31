class AddAlcoholToGins < ActiveRecord::Migration[5.2]
  def change
    add_column :gins, :alcoholic, :boolean
  end
end
