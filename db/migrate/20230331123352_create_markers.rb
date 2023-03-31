class CreateMarkers < ActiveRecord::Migration[6.0]
  def change
    create_table :markers do |t|
      t.references :location_map, null: false, foreign_key: true
      t.references :markerable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
