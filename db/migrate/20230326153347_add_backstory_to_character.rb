class AddBackstoryToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :backstory, :text
  end
end
