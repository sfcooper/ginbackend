class AddSlugToDistilleries < ActiveRecord::Migration[5.2]
  def change
    add_column :distilleries, :slug, :string
  end
end
