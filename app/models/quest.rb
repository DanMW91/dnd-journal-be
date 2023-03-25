class Quest < ApplicationRecord
  include KeyWordable
  include WriteUpMentionable

  key_word_field :title

  belongs_to :campaign
  belongs_to :location, optional: true
  belongs_to :npc, optional: true

  validates :title, uniqueness: true
end
