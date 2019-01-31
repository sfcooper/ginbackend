class CreateBotanicalsGins < ActiveRecord::Migration[5.2]
  def change
    create_table :botanicals_gins do |t|
      t.integer :botanical_id
      t.integer :gin_id

      t.timestamps
    end
  end
end
