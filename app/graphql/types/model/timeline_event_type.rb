module Types
  module Model
    class TimelineEventType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :content, String, null: false
      field :description, String, null: true
      field :death, Boolean, null: false
      field :event_type, Types::Enums::EventTypeType, null: false
      field :time_lineable, Types::TimeLineableType, null: true
    end
  end
end
