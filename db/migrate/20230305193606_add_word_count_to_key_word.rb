class AddWordCountToKeyWord < ActiveRecord::Migration[6.0]
  def change
    add_column :key_words, :word_count, :integer
  end
end
