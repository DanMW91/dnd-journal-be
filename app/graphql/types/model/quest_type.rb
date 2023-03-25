module Types
  module Model
    class QuestType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :title, String, null: false
      field :description, ID, null: false
      field :location, Types::Model::LocationType, null: true
      field :campaign, Types::Model::CampaignType, null: false
      field :npc, Types::Model::NpcType, null: true
      field :reward, String, null: true
      field :complete, Boolean, null: false
      field :display_info, String, null: false
      field :display_title, String, null: false

      def display_info
        object.description
      end

      def display_title
        object.title
      end
    end
  end
end
