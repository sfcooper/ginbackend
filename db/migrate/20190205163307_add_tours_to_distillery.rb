class AddToursToDistillery < ActiveRecord::Migration[5.2]
  def change
    add_column :distilleries, :tours, :boolean
  end
end
