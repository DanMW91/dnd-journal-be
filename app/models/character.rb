class Character < ApplicationRecord
  include KeyWordable
  include WriteUpMentionable
  include StringStrippable

  key_word_field :first_name

  belongs_to :user
  belongs_to :campaign
  has_one :image, as: :imageable, dependent: :destroy
  has_many :group_members, as: :group_memberable
  has_many :notable_groups, through: :group_members

  validates :first_name, uniqueness: { scope: :campaign_id }
  validates :first_name, :campaign, :bio, presence: true

  # before_create { first_name.downcase! }
end
