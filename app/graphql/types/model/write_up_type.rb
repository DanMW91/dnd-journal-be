module Types
  module Model
    class WriteUpType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :content, String, null: false
      field :session_number, ID, null: true
      field :title, String, null: false
      field :campaign, Types::Model::CampaignType, null: false
      field :timeline_events, [Types::Model::TimelineEventType], null: true
    end
  end
end
