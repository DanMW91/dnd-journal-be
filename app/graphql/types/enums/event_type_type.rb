module Types
  module Enums
    class EventTypeType < Types::BaseEnum
      ::TimelineEvent.event_types.each_key do |key|
        value(key)
      end
    end
  end
end
