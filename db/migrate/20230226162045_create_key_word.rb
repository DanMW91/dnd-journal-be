class CreateKeyWord < ActiveRecord::Migration[6.0]
  def change
    create_table :key_words do |t|
      t.references :key_wordable, polymorphic: true, null: false
    end
  end
end
