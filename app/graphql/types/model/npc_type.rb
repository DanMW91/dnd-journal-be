module Types
  module Model
    class NpcType < GraphQL::Schema::Object
      field :id, ID, null: false
      field :first_name, String, null: true
      field :last_name, ID, null: true
      field :description, String, null: false
      field :campaign, Types::Model::CampaignType, null: false
      field :display_info, String, null: false
      field :display_title, String, null: false
      field :image_url, String, null: true
      field :key_words, [Types::Model::KeyWordType], null: false

      def key_words
        object.key_words.reject { |kw| kw.key_word == object.first_name }
      end

      def image_url
        object.image&.url
      end

      def display_info
        object.description
      end

      def display_title
        object.first_name
      end
    end
  end
end
