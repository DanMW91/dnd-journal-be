module Types
  module Model
    class LocationType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :name, String, null: true
      field :description, String, null: false
      field :campaign, Types::Model::CampaignType, null: false
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
