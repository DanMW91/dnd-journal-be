class AddCampaignToNpc < ActiveRecord::Migration[6.0]
  def change
    add_reference :npcs, :campaign, null: false, foreign_key: true
  end
end
