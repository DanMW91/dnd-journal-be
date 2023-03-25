class AddBioToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :bio, :text
  end
end
