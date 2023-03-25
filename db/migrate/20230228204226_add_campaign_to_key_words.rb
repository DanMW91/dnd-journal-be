class AddCampaignToKeyWords < ActiveRecord::Migration[6.0]
  def change
    add_reference :key_words, :campaign, foreign_key: true
  end
end
