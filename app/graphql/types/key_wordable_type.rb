module Types
  class KeyWordableType < Types::BaseUnion
    possible_types Types::Model::CharacterType,
                   Types::Model::CampaignType,
                   Types::Model::NpcType,
                   Types::Model::QuestType,
                   Types::Model::LocationType,
                   Types::Model::NotableGroupType

    def self.resolve_type(object, context)
      case object.class.name
      when 'Campaign'
        Types::Model::CampaignType
      when 'Character'
        Types::Model::CharacterType
      when 'Npc'
        Types::Model::NpcType
      when 'Quest'
        Types::Model::QuestType
      when 'Location'
        Types::Model::LocationType
      when 'NotableGroup'
        Types::Model::NotableGroupType
      end
    end
  end
end
