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
      field :notable_groups, [Types::Model::NotableGroupType], null: false

      def key_words
        object.key_words.reject { |kw| kw.key_word == object.first_name }
      end

      def image_url
        object.image&.url || 'https://dnd-journal-2.s3.eu-west-2.amazonaws.com/uploads/npc/1eacae9f-5acc-42d9-86e7-85e7aa338154/dan91_single_fantasy_warrior_bust_silhouette_gold_brown_42d1e3fa-07a8-4f29-8d53-ad3d07f296d4.png'
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
