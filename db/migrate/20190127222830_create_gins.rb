class CreateGins < ActiveRecord::Migration[5.2]
  def change
    create_table :gins do |t|
      t.string :title
      t.string :snippet
      t.text :description
      t.float :abv

      t.timestamps
    end
  end
end
