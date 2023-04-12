class NotableGroup < ApplicationRecord
  include KeyWordable
  include WriteUpMentionable
  include StringStrippable

  key_word_field :name

  belongs_to :location, optional: true
  belongs_to :campaign

  has_one :image, as: :imageable, dependent: :destroy

  has_many :group_members
  has_many :npcs, through: :group_members,
                  source: :group_memberable,
                  source_type: 'Npc'
  has_many :characters, through: :group_members,
                        source: :group_memberable,
                        source_type: 'Character'

  validates :name, :campaign, presence: true
  validates :name, uniqueness: true
end
