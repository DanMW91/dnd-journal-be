class CreateQuests < ActiveRecord::Migration[6.0]
  def change
    create_table :quests do |t|
      t.string :title, null: false
      t.references :campaign, null: false, foreign_key: true
      t.references :location, null: true, foreign_key: true
      t.string :reward
      t.references :npc, null: true, foreign_key: true
      t.string :description, null: false
      t.boolean :complete, null: false, default: false

      t.timestamps
    end
  end
end
