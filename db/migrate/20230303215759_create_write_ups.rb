class CreateWriteUps < ActiveRecord::Migration[6.0]
  def change
    create_table :write_ups do |t|
      t.references :campaign, null: false, foreign_key: true
      t.text :content
      t.integer :session_number
      t.string :title

      t.timestamps
    end
  end
end
