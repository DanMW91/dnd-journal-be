class KeyWord < ApplicationRecord
  belongs_to :key_wordable, polymorphic: true
  belongs_to :campaign
  has_many :write_up_mentions, dependent: :destroy

  validates :key_word, uniqueness: { scope: :campaign }
end
