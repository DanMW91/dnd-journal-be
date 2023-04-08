class CreateTimelineEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :timeline_events do |t|
      t.integer :event_type, null: false
      t.references :write_up, null: false
      t.references :time_lineable, polymorphic: true, index: { name: :idx_time_lne_evnts_on_time_linable_typ_and_time_lnable_id }
      t.boolean :death, null: false
      t.string :description, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
