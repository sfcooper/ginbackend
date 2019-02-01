class AddForeignKeyToGins < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :gins, :distilleries
  end
end
