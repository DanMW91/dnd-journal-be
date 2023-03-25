class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
