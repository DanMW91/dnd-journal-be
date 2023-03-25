module WriteUpMentionable
  extend ActiveSupport::Concern

  included do
    has_many :write_up_mentions, as: :write_up_mentionable
    has_many :write_ups, through: :write_up_mentions
  end
end
