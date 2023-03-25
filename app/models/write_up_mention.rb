class WriteUpMention < ApplicationRecord
  belongs_to :write_up
  belongs_to :write_up_mentionable, polymorphic: true
end
