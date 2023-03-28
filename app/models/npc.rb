class Npc < ApplicationRecord
  include KeyWordable
  include WriteUpMentionable
  include StringStrippable

  key_word_field :first_name
  belongs_to :campaign
  has_one :image, as: :imageable, dependent: :destroy
  has_many :group_members, as: :group_memberable
  has_many :notable_groups, through: :group_members

  validates :first_name, :campaign, :description, presence: true
  validates :first_name, uniqueness: true
end
