module Types
  module Model
    class NotableGroupType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :name, String, null: true
      field :description, String, null: false
      field :campaign, Types::Model::CampaignType, null: false
      field :location, Types::Model::LocationType, null: true
      field :npcs, [Types::Model::NpcType], null: true
      field :characters, [Types::Model::CharacterType], null: true
      field :display_info, String, null: false
      field :display_title, String, null: false

      def display_info
        object.description
      end

      def display_title
        object.name
      end
    end
  end
end
