class Location < ApplicationRecord
  include KeyWordable
  include WriteUpMentionable
  include StringStrippable

  key_word_field :name

  belongs_to :campaign

  validates :name, uniqueness: true
end
