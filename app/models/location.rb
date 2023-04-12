class Location < ApplicationRecord
  include KeyWordable
  include WriteUpMentionable
  include StringStrippable

  key_word_field :name

  belongs_to :campaign

  has_one :location_map
  has_one :image, as: :imageable, dependent: :destroy
  validates :name, uniqueness: true
end
