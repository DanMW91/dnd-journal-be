class CreateWriteUpMentions < ActiveRecord::Migration[6.0]
  def change
    create_table :write_up_mentions do |t|
      t.references :write_up, null: false, foreign_key: true
      t.references :write_up_mentionable, polymorphic: true, null: false, index: { name: 'idx_wrte_up_mntns_on_wrte_up_mntnble_typ_nd_wrte_up_menble_id' }

      t.timestamps
    end
  end
end
