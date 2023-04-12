module Types
  module Model
    class LocationType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :name, String, null: true
      field :description, String, null: false
      field :campaign, Types::Model::CampaignType, null: false
      field :display_info, String, null: false
      field :display_title, String, null: false
      field :location_map, Types::Model::LocationMapType, null: true
      field :image_url, String, null: false

      def image_url
        object.image&.url ||
          'https://dnd-journal-2.s3.eu-west-2.amazonaws.com/uploads/npc/26b5c24a-6d0f-40a1-a180-4b276420c686/dan91_fantasy_building_silhouette_icon_gold_brown_dark_backgrou_3e2bfd10-989e-4777-9784-c68559dd733e.png'
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
