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
      field :image_url, String, null: false

      def image_url
        object.image&.url ||
          'https://dnd-journal-2.s3.eu-west-2.amazonaws.com/uploads/npc/58336760-4715-4391-ab8b-3bf54d65df39/dan91_fantasy_warrior_group_silhouette._grey_background_900a89dc-b3f5-44ea-ac40-e7dd19d5cd04.png'
      end

      def display_info
        object.description
      end

      def display_title
        object.name
      end
    end
  end
end
