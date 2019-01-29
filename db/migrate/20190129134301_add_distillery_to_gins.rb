class AddDistilleryToGins < ActiveRecord::Migration[5.2]
  def change
    add_column :gins, :distillery_id, :integer
  end
end
