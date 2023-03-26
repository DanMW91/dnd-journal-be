module Types
  module Model
    class CharacterType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :first_name, String, null: true
      field :last_name, ID, null: true
      field :bio, String, null: false
      field :campaign, Types::Model::CampaignType, null: false
      field :user, Types::Model::UserType, null: false
      field :display_info, String, null: false
      field :display_title, String, null: false
      field :image_url, String, null: true
      field :backstory, String, null: true

      def image_url
        object.image&.url
      end

      def display_info
        object.bio
      end

      def display_title
        object.first_name
      end
    end
  end
end
