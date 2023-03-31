class AddPositionsToMarkers < ActiveRecord::Migration[6.0]
  def change
    add_column :markers, :offset_x, :string, null: false
    add_column :markers, :offset_y, :string, null: false
  end
end
