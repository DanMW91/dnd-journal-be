class TimelineEvent < ApplicationRecord
  has_one :image, as: :imageable, dependent: :destroy
  belongs_to :time_lineable, polymorphic: true, optional: true
  belongs_to :write_up, required: true
  enum event_type: {
    character: 0,
    npc: 1,
    quest: 2,
    location: 3,
    general: 4
  }
end
