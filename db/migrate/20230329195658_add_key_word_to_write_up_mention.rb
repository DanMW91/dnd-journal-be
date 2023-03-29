class AddKeyWordToWriteUpMention < ActiveRecord::Migration[6.0]
  def change
    add_reference :write_up_mentions, :key_word, foreign_key: true
  end
end
