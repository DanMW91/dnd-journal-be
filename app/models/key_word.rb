class KeyWord < ApplicationRecord
  belongs_to :key_wordable, polymorphic: true
  belongs_to :campaign
end
