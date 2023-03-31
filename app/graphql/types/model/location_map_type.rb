module Types
  module Model
    class LocationMapType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :image_url, String, null: false
      field :markers, [Types::Model::MarkerType], null: true

      def image_url
        object.image&.url
      end
    end
  end
end
