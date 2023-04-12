module Types
  module Model
    class WriteUpType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :content, String, null: false
      field :session_number, ID, null: true
      field :title, String, null: false
      field :campaign, Types::Model::CampaignType, null: false
      field :timeline_events, [Types::Model::TimelineEventType], null: true
      field :write_up_total, Integer, null: false

      def write_up_total
        object.campaign.write_ups.maximum(:session_number)
      end
    end
  end
end
