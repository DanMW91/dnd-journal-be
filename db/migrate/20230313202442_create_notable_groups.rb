class CreateNotableGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :notable_groups do |t|
      t.string :name
      t.text :description
      t.references :location, null: true, foreign_key: true
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
