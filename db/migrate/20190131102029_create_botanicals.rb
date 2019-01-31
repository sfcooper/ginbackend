class CreateBotanicals < ActiveRecord::Migration[5.2]
  def change
    create_table :botanicals do |t|
      t.string :botanical_name
      t.string :slug
      t.text :description
      t.string :snippet

      t.timestamps
    end
  end
end
