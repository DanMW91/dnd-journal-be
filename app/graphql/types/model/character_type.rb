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
      field :notable_groups, [Types::Model::NotableGroupType], null: true
      field :image_url, String, null: true
      field :backstory, String, null: true
      field :key_words, [Types::Model::KeyWordType], null: false

      def key_words
        object.key_words.reject { |kw| kw.key_word == object.first_name }
      end

      def image_url
        object.image&.url || 'https://i.pinimg.com/736x/83/bc/8b/83bc8b88cf6bc4b4e04d153a418cde62.jpg'
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
