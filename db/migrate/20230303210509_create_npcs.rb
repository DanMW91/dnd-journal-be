class CreateNpcs < ActiveRecord::Migration[6.0]
  def change
    create_table :npcs do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :description, null: false

      t.timestamps
    end
  end
end
