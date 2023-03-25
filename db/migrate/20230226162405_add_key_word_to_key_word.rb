class AddKeyWordToKeyWord < ActiveRecord::Migration[6.0]
  def change
    add_column :key_words, :key_word, :string, null: false
  end
end
