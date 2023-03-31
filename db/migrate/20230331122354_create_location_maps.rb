class CreateLocationMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :location_maps do |t|
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
