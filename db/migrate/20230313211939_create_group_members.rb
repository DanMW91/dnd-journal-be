class CreateGroupMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_members do |t|
      t.references :notable_group, null: false, foreign_key: true
      t.references :group_memberable, polymorphic: true, null: false, index: { name: 'idx_crt_grp_mmbrs_on_grp_mmbrble_typ_n_grp_mmbrble_id' }

      t.timestamps
    end
  end
end
