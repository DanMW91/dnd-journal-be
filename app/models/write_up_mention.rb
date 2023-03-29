class WriteUpMention < ApplicationRecord
  belongs_to :write_up
  belongs_to :write_up_mentionable, polymorphic: true
  belongs_to :key_word
end
