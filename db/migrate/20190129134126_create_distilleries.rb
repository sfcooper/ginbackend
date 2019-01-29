class CreateDistilleries < ActiveRecord::Migration[5.2]
  def change
    create_table :distilleries do |t|
      t.string :distillery_name
      t.string :snippet
      t.text :description
      t.string :website
      t.string :country

      t.timestamps
    end
  end
end
