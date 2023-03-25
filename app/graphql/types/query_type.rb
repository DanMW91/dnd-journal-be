module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field_class GraphqlDevise::Types::BaseField

    field :key_words, [Types::Model::KeyWordType], null: false, authenticate: false do
      argument :campaign_id, ID, required: true
    end

    def key_words(campaign_id:)
      KeyWord.where(campaign_id: campaign_id)
    end

    field :characters, [Types::Model::CharacterType], null: true do
      argument :campaign_name, String, required: true
    end

    def characters(campaign_name:)
      context[:current_resource].campaigns.find_by(name: campaign_name).characters
    end

    field :character, Types::Model::CharacterType, null: true do
      argument :character_name, String, required: true
      argument :campaign_name, String, required: true
    end

    def character(character_name:, campaign_name:)
      context[:current_resource].campaigns.find_by(
        name: campaign_name
      ).characters.find_by(
        first_name: character_name
      )
    end

    field :npcs, [Types::Model::NpcType], null: true do
      argument :campaign_name, String, required: true
    end

    def npcs(campaign_name:)
      context[:current_resource].campaigns.find_by(name: campaign_name).npcs
    end

    field :npc, Types::Model::NpcType, null: true do
      argument :npc_name, String, required: true
      argument :campaign_name, String, required: true
    end

    def npc(npc_name:, campaign_name:)
      context[:current_resource].campaigns.find_by(
        name: campaign_name
      ).npcs.find_by(
        first_name: npc_name
      )
    end

    field :campaigns, [Types::Model::CampaignType], null: true

    def campaigns
      context[:current_resource].campaigns
    end

    field :key_wordable, Types::KeyWordableType, null: false, authenticate: false do
      argument :key_wordable_id, ID, required: true
      argument :key_wordable_type, String, required: true
    end

    def key_wordable(key_wordable_type:, key_wordable_id:)
      key_wordable_type.constantize.find(key_wordable_id)
    end

    field :write_ups, [Types::Model::WriteUpType], null: true do
      argument :campaign_name, String, required: true
    end

    def write_ups(campaign_name:)
      context[:current_resource].campaigns.find_by(
        name: campaign_name
      ).write_ups
    end

    field :write_up, Types::Model::WriteUpType, null: true do
      argument :campaign_name, String, required: true
      argument :session_number, Int, required: true
    end

    def write_up(campaign_name:, session_number:)
      context[:current_resource].campaigns.find_by(
        name: campaign_name
      ).write_ups.find_by(
        session_number: session_number
      )
    end

    field :write_ups_for_mentions, [Types::Model::WriteUpType], null: true do
      argument :resource_type, String, required: true
      argument :resource_id, ID, required: true
    end

    def write_ups_for_mentions(resource_type:, resource_id:)
      WriteUpMention.where(
        write_up_mentionable_type: resource_type,
        write_up_mentionable_id: resource_id
      ).map(&:write_up)
    end

    field :quest, Types::Model::QuestType, null: false do
      argument :campaign_name, String, required: true
      argument :quest_title, String, required: true
    end

    def quest(campaign_name:, quest_title:)
      context[:current_resource].campaigns.find_by(
        name: campaign_name
      ).quests.find_by(
        title: quest_title
      )
    end

    field :quests, [Types::Model::QuestType], null: true do
      argument :campaign_name, String, required: true
    end

    def quests(campaign_name:)
      context[:current_resource].campaigns.find_by(
        name: campaign_name
      ).quests
    end

    field :notable_groups, [Types::Model::NotableGroupType], null: true do
      argument :campaign_name, String, required: true
    end

    def notable_groups(campaign_name:)
      context[:current_resource].campaigns.find_by(
        name: campaign_name
      ).notable_groups
    end

    field :notable_group, Types::Model::NotableGroupType, null: false do
      argument :campaign_name, String, required: true
      argument :notable_group_name, String, required: true
    end

    def notable_group(campaign_name:, notable_group_name:)
      context[:current_resource].campaigns.find_by(
        name: campaign_name
      ).notable_groups.find_by(
        name: notable_group_name
      )
    end

    field :location, Types::Model::LocationType, null: false do
      argument :campaign_name, String, required: true
      argument :location_name, String, required: true
    end

    def location(campaign_name:, location_name:)
      context[:current_resource].campaigns.find_by(
        name: campaign_name
      ).locations.find_by(
        name: location_name
      )
    end

    field :locations, [Types::Model::LocationType], null: true do
      argument :campaign_name, String, required: true
    end

    def locations(campaign_name:)
      context[:current_resource].campaigns.find_by(
        name: campaign_name
      ).locations
    end
  end
end
